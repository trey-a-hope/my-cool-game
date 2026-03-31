# Use Codemagic's build dir if available, otherwise resolve from script location
if [ -n "$CM_BUILD_DIR" ]; then
  PROJECT_DIR="$CM_BUILD_DIR"
else
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  PROJECT_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
fi

echo "PROJECT_DIR: $PROJECT_DIR"

# Delete stale keychain if exists
security delete-keychain build.keychain 2>/dev/null || true

# Import Developer ID cert
printf "%s" "$DEVELOPER_ID_P12" | base64 --decode > /tmp/developer_id.p12
security create-keychain -p "" build.keychain
security list-keychains -d user -s build.keychain ~/Library/Keychains/login.keychain-db
security default-keychain -s build.keychain
security unlock-keychain -p "" build.keychain
security import /tmp/developer_id.p12 \
  -k build.keychain \
  -P "$DEVELOPER_ID_P12_PASSWORD" \
  -T /usr/bin/codesign
security set-key-partition-list \
  -S apple-tool:,apple:,codesign: \
  -s -k "" \
  build.keychain

security find-identity -v -p codesigning

APP_NAME="My Cool Game"
IDENTITY="Developer ID Application: Tr3umphant.Designs, LLC (AYXEVPG9Z5)"
APP_PATH=$(find "$PROJECT_DIR/build/macos/Build/Products/Release" -name "*.app" | head -1)
DMG_PATH="$PROJECT_DIR/$APP_NAME.dmg"

echo "APP_PATH: $APP_PATH"
echo "DMG_PATH: $DMG_PATH"

codesign --deep --force --verify --verbose \
  --sign "$IDENTITY" \
  --options runtime \
  "$APP_PATH"

rm -f "$DMG_PATH"

# Create DMG using hdiutil instead of create-dmg
hdiutil create \
  -volname "$APP_NAME" \
  -srcfolder "$APP_PATH" \
  -ov \
  -format UDZO \
  "$DMG_PATH"

xcrun notarytool submit "$DMG_PATH" \
  --apple-id "trey.a.hope@gmail.com" \
  --team-id "AYXEVPG9Z5" \
  --password "$APP_SPECIFIC_PASSWORD" \
  --wait

xcrun stapler staple "$DMG_PATH"

# Copy DMG to artifacts (codemagic only)
if [ -n "$CM_BUILD_DIR" ]; then
  mkdir -p "$CM_EXPORT_DIR"
  cp "$DMG_PATH" "$CM_EXPORT_DIR/$APP_NAME.dmg"
fi

