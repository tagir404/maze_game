import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:maze_game/services/settings_service.dart';

class AudioService {
  AudioService(this.settingsService);

  final SettingsService settingsService;

  late final AudioSource doorOpen;

  Future<void> init() async {
    await SoLoud.instance.init();

    doorOpen = await SoLoud.instance.loadAsset('assets/sounds/door_open.mp3');
  }

  void playDoorOpen() {
    if (!settingsService.soundEnabled) return;

    SoLoud.instance.play(doorOpen);
  }
}
