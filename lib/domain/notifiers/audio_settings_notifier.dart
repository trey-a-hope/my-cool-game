import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:my_cool_game/domain/core/models/audio_settings.dart';

class AudioSettingsNotifier extends riverpod.Notifier<AudioSettings> {
  bool _isMusicInitialized = false;

  @override
  AudioSettings build() => AudioSettings();

  void initializeMusic(String musicFile) async {
    if (!_isMusicInitialized) {
      FlameAudio.bgm.play(musicFile);
      _isMusicInitialized = true;
    }

    await FlameAudio.bgm.audioPlayer.setVolume(
      state.isMusicMuted ? 0.0 : state.musicVolume,
    );
  }

  void setMusicVolume(double volume) {
    state = state.copyWith(
      musicVolume: volume,
      lastMusicVolume: volume,
      isMusicMuted: false,
    );

    FlameAudio.bgm.audioPlayer.setVolume(volume);
  }

  void setSfxVolume(double volume) {
    state = state.copyWith(
      sfxVolume: volume,
      lastSfxVolume: volume,
      isSfxMuted: false,
    );
  }

  void toggleMusicMute() {
    final isMuted = !state.isMusicMuted;
    final newVolume = isMuted ? 0.0 : state.lastMusicVolume;

    state = state.copyWith(
      musicVolume: newVolume,
      isMusicMuted: isMuted,
    );

    FlameAudio.bgm.audioPlayer.setVolume(newVolume);
  }

  void toggleSfxMute() {
    final isMuted = !state.isSfxMuted;
    final newVolume = isMuted ? 0.0 : state.lastSfxVolume;

    state = state.copyWith(
      sfxVolume: newVolume,
      isSfxMuted: isMuted,
    );
  }
}
