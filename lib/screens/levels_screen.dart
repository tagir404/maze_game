import 'package:flutter/material.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/dialogs/level_locked_dialog.dart';
import 'package:maze_game/dialogs/premium_purchase_dialog.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_button.dart';
import 'package:maze_game/widgets/coins_display.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final progressService = AppDependencies.of(context).progressService;
    final unlockedLevel = progressService.getUnlockedLevel();

    return AnimatedBuilder(
      animation: walletService,
      builder: (context, _) {
        final hasPremiumAccess = walletService.hasPremiumAccess;

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.levels),
            actions: [
              if (hasPremiumAccess)
                _PremiumAccessActiveBadge(
                  color: Theme.of(context).colorScheme.primary,
                )
              else
                TextButton.icon(
                  onPressed: () => showPremiumRequiredDialog(context),
                  label: Text(l10n.unlockPremiumLevels),
                  icon: Icon(
                    Icons.workspace_premium,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: CoinsDisplay(quantity: walletService.coins),
                ),
              ),
            ],
            actionsPadding: const EdgeInsets.only(right: 20),
          ),
          body: SafeArea(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: levels.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final level = levels[index];
                final levelNumber = index + 1;
                final isUnlocked = levelNumber <= unlockedLevel;
                final isPremiumLocked = level.isPremium && !hasPremiumAccess;
                final isPlayable = isUnlocked && !isPremiumLocked;

                return AppButton(
                  onPressed: () async {
                    if (isPlayable) {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => GameScreen(
                            level: level,
                            levelNumber: levelNumber,
                          ),
                        ),
                      );
                    } else if (isPremiumLocked) {
                      await showPremiumRequiredDialog(context);
                    } else {
                      await showLevelLockedDialog(context);
                    }
                  },
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Text(
                        '$levelNumber',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (isPremiumLocked)
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Icon(
                            Icons.workspace_premium,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      else if (!isUnlocked)
                        const Positioned(
                          right: 8,
                          top: 8,
                          child: Icon(Icons.lock, size: 20),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _PremiumAccessActiveBadge extends StatelessWidget {
  const _PremiumAccessActiveBadge({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context).premiumAccessActive),
            const SizedBox(width: 8),
            Icon(Icons.workspace_premium, size: 24, color: color),
          ],
        ),
      ),
    );
  }
}
