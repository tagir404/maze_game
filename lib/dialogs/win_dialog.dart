import 'package:flutter/material.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/screens/game_screen.dart';
import 'package:maze_game/widgets/app_dialog.dart';

Future<void> showWinDialog(
  BuildContext context, {
  required int levelNumber,
  required int roomsCount,
}) {
  final hasNextLevel = levelNumber < levels.length;

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AppDialog(
      title: 'Уровень пройден!',
      content: Text(
        'Ты нашёл выход из уровня $levelNumber. Комнат: $roomsCount.',
      ),
      actions: [
        FilledButton(
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          child: const Text('В меню'),
        ),
        if (hasNextLevel)
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => GameScreen(
                    level: levels[levelNumber],
                    levelNumber: levelNumber + 1,
                  ),
                ),
              );
            },
            child: const Text('Следующий уровень'),
          ),
      ],
    ),
  );
}
