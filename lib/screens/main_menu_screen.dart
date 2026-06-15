import 'package:flutter/material.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/screens/levels_screen.dart';
import 'package:maze_game/screens/settings_screen.dart';
import 'package:maze_game/widgets/menu_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B2040), Color(0xFF101321)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.door_sliding,
                      size: 60,
                      color: Color(0xFFF3BF45),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Лабиринт',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    MenuButton(
                      icon: Icons.play_arrow_rounded,
                      label: 'Играть',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              GameScreen(level: levels.first, levelId: 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    MenuButton(
                      icon: Icons.map_rounded,
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
      ),
    );
  }
}
