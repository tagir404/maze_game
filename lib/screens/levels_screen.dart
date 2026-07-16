import 'package:flutter/material.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/dialogs/level_locked_dialog.dart';
import 'package:maze_game/dialogs/premium_purchase_dialog.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_button.dart';
import 'package:maze_game/widgets/coins_display.dart';

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
            onPressed: () async {
              final shouldBuy = await showPremiumRequiredDialog(context);

              if (shouldBuy == true) {
                // Покупка
              }
            },
            label: const Text('Открыть премиум уровни'),
            icon: const Icon(
              Icons.workspace_premium,
              size: 24,
              color: Color(0xFFF3BF45),
            ),
            iconAlignment: IconAlignment.end,
          ),
          AnimatedBuilder(
            animation: walletService,
            builder: (context, _) => Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CoinsDisplay(quantity: walletService.coins),
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 20),
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
          final levelIndex = index + 1;
          final isUnlocked = levelIndex <= unlockedLevel;

          return AppButton(
            onPressed: () async {
              if (isUnlocked) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) =>
                        GameScreen(level: level, levelIndex: levelIndex),
                  ),
                );
              } else if (level.isPremium && true) {
                final shouldBuy = await showPremiumRequiredDialog(context);

                if (shouldBuy == true) {
                  // Покупка
                }
              } else {
                await showLevelLockedDialog(context);
              }
            },
            child: Stack(
              // fit: StackFit.expand,
              alignment: AlignmentGeometry.center,
              children: [
                Text(
                  '${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (level.isPremium)
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.workspace_premium,
                      size: 16,
                      color: Color(0xFFF3BF45),
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
