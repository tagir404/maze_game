import 'package:flutter/material.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/dialogs/premium_purchase_dialog.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/app_dialog.dart';

Future<void> showWinDialog(
  BuildContext context, {
  required int levelNumber,
  required int roomsCount,
}) {
  final hasNextLevel = levelNumber < levels.length;
  final nextLevel = hasNextLevel ? levels[levelNumber] : null;

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AppDialog(
      title: AppLocalizations.of(context).levelCompleted,
      iconData: Icons.check,
      content: Text(
        AppLocalizations.of(context).winMessage(levelNumber, roomsCount),
      ),
      actions: [
        FilledButton(
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          child: Text(AppLocalizations.of(context).toMenu),
        ),
        if (hasNextLevel)
          FilledButton(
            onPressed: () async {
              final nextMazeLevel = nextLevel!;
              final nextLevelRequiresPremium =
                  nextMazeLevel.isPremium && !walletService.hasPremiumAccess;

              if (nextLevelRequiresPremium) {
                final premiumBought = await showPremiumRequiredDialog(context);
                if (!context.mounted || premiumBought != true) return;
              }

              if (!context.mounted) return;

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => GameScreen(
                    level: nextMazeLevel,
                    levelNumber: levelNumber + 1,
                  ),
                ),
              );
            },
            child: Text(AppLocalizations.of(context).nextLevel),
          ),
      ],
    ),
  );
}
