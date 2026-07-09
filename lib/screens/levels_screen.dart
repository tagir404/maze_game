import 'package:flutter/material.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/widgets/premium_dialog.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressService = AppDependencies.of(context).progressService;
    final unlockedLevel = progressService.getUnlockedLevel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Уровни'),
        actions: [
          TextButton.icon(
            onPressed: () {
              // Покупка
            },
            label: const Text('Открыть премиум уровни'),
            icon: const Icon(
              Icons.workspace_premium,
              size: 24,
              color: Color(0xFFFFD60A),
            ),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: levels.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 70,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final level = levels[index];
          final levelNumber = index + 1;
          final isUnlocked = levelNumber <= unlockedLevel;

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => {
              if (isUnlocked)
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) =>
                        GameScreen(level: level, levelIndex: index + 1),
                  ),
                )
              else if (level.isPremium &&
                  true) // TODO заменить на проверку есть ли премиум или нет
                showDialog(
                  context: context,
                  builder: (_) => const PremiumDialog(),
                ),
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? const Color(0xFF202642)
                        : const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                if (level.isPremium)
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.workspace_premium,
                      size: 16,
                      color: Color(0xFFFFD60A),
                    ),
                  )
                else if (!isUnlocked)
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(Icons.lock, size: 16),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
