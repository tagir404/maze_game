import 'package:flutter_soloud/flutter_soloud.dart';

final audioService = AudioService();

class AudioService {
  late final AudioSource doorOpen;

  Future<void> init() async {
    await SoLoud.instance.init();

    doorOpen = await SoLoud.instance.loadAsset('assets/sounds/door_open.mp3');
  }

  void playDoorOpen() {
    SoLoud.instance.play(doorOpen);
  }
}
