import 'dart:async';

import 'package:flutter/services.dart';

class SoundEffects {
  const SoundEffects._();

  static void playDoorSwitch() {
    _play(SystemSoundType.click);
  }

  static void playRoomEntry() {
    _play(SystemSoundType.alert);
  }

  static void _play(SystemSoundType type) {
    SystemSound.play(type).ignore();
  }
}
