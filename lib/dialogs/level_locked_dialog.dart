import 'package:flutter/material.dart';
import 'package:maze_game/widgets/app_dialog.dart';

Future<void> showLevelLockedDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (_) => const _LevelLockedDialog(),
  );
}

class _LevelLockedDialog extends StatelessWidget {
  const _LevelLockedDialog();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      iconData: Icons.lock,
      iconColor: const Color(0xFFF3BF45),
      title: "Уровень закрыт",
      content: const Text(
        "Этот уровень станет доступен после прохождения предыдущих уровней",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Закрыть"),
        ),
      ],
    );
  }
}
