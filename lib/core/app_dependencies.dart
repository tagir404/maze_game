import 'package:flutter/material.dart';
import 'package:maze_game/services/progress_service.dart';
import 'package:maze_game/services/settings_service.dart';

class AppDependencies extends InheritedWidget {
  const AppDependencies({
    required this.progressService,
    required this.settingsService,
    required super.child,
    super.key,
  });

  final ProgressService progressService;
  final SettingsService settingsService;

  static AppDependencies? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  static AppDependencies of(BuildContext context) {
    final AppDependencies? result = maybeOf(context);
    assert(result != null, 'AppDependencies not found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) => false;
}
