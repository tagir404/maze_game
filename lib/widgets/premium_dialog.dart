import 'package:flutter/material.dart';

class PremiumDialog extends StatelessWidget {
  const PremiumDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.workspace_premium, size: 40, color: Colors.amber),
      title: const Text("Премиум уровень"),
      content: const Text(
        "Этот уровень доступен только после покупки комплекта премиум уровней.",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Позже"),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            // TODO Добавить логику покупки
          },
          child: const Text("Купить"),
        ),
      ],
    );
  }
}
