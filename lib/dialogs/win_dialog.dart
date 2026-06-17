import 'package:flutter/material.dart';
import 'package:maze_game/data/levels.dart';
import 'package:maze_game/screens/game_screen.dart';

Future<void> showWinDialog(
  BuildContext context, {
  required int levelIndex,
  required int roomsCount,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Уровень пройден!'),
      content: Text(
        'Ты нашёл выход из уровня $levelIndex. Комнат: $roomsCount.',
      ),
      actions: [
        FilledButton(
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          child: const Text('В меню'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (_) => GameScreen(
                level: levels[levelIndex],
                levelIndex: levelIndex + 1,
              ),
            ),
          ),
          child: const Text('Следующий уровень'),
        ),
      ],
    ),
  );
}
