#!/bin/bash
# relase
shorebird release macos --dart-define-from-file=./env/prod.json
# patch
# shorebird patch --platforms=macos --release-version=26.3.3+5