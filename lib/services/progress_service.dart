import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  final SharedPreferences prefs;

  ProgressService(this.prefs);

  static const _unlockedLevelKey = 'unlocked_level';

  int getUnlockedLevel() => prefs.getInt(_unlockedLevelKey) ?? 1;

  Future<void> unlockNextLevel(int currentLevel) async {
    final unlocked = getUnlockedLevel();

    if (currentLevel + 1 > unlocked) {
      await prefs.setInt(_unlockedLevelKey, currentLevel + 1);
    }
  }
}
