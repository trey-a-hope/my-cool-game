class AudioSettings {
  double musicVolume;
  double lastMusicVolume;
  bool isMusicMuted;
  double sfxVolume;
  double lastSfxVolume;
  bool isSfxMuted;

  AudioSettings({
    this.musicVolume = 0.3,
    this.lastMusicVolume = 0.3,
    this.isMusicMuted = false,
    this.sfxVolume = 1.0,
    this.lastSfxVolume = 1.0,
    this.isSfxMuted = false,
  });

  AudioSettings copyWith({
    double? musicVolume,
    double? lastMusicVolume,
    bool? isMusicMuted,
    double? sfxVolume,
    double? lastSfxVolume,
    bool? isSfxMuted,
  }) =>
      AudioSettings(
        musicVolume: musicVolume ?? this.musicVolume,
        lastMusicVolume: lastMusicVolume ?? this.lastMusicVolume,
        isMusicMuted: isMusicMuted ?? this.isMusicMuted,
        sfxVolume: sfxVolume ?? this.sfxVolume,
        lastSfxVolume: lastSfxVolume ?? this.lastSfxVolume,
        isSfxMuted: isSfxMuted ?? this.isSfxMuted,
      );
}
