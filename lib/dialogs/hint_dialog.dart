import 'package:flutter/material.dart';

Future<bool?> showHintDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Подсказка'),
      content: const Text('Показать подсказку для комнаты?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Нет'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Да'),
        ),
      ],
    ),
  );
}
