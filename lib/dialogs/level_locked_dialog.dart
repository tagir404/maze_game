import 'package:flutter/material.dart';
import 'package:maze_game/l10n/app_localizations.dart';
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
      title: AppLocalizations.of(context).levelLocked,
      content: Text(AppLocalizations.of(context).levelLockedDescription),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context).close),
        ),
      ],
    );
  }
}
