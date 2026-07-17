import 'package:flutter/material.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/screens/levels_screen.dart';
import 'package:maze_game/screens/settings_screen.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/menu_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressService = AppDependencies.of(context).progressService;
    final unlockedLevel = progressService.getUnlockedLevel();

    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) {
        final playableLevelIndex = _playableLevelIndex(unlockedLevel);

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.door_sliding,
                        size: 60,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Лабиринт',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MenuButton(
                        icon: Icons.play_arrow_rounded,
                        label: 'Играть',
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => GameScreen(
                              level: levels[playableLevelIndex - 1],
                              levelNumber: playableLevelIndex,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      MenuButton(
                        icon: Icons.grid_view,
                        label: 'Уровни',
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const LevelsScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      MenuButton(
                        icon: Icons.settings_rounded,
                        label: 'Настройки',
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const SettingsScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

int _playableLevelIndex(int unlockedLevel) {
  final levelNumber = unlockedLevel.clamp(1, levels.length).toInt();
  if (walletService.hasPremiumAccess) return levelNumber;
  if (!levels[levelNumber - 1].isPremium) return levelNumber;

  return levels.lastIndexWhere((level) => !level.isPremium) + 1;
}
