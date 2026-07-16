import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final double iconSize;
  final String title;
  final Widget? content;
  final List<Widget> actions;

  const AppDialog({
    super.key,
    this.iconData,
    this.iconColor,
    this.iconSize = 40,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(iconData, size: iconSize),
      iconColor: iconColor,
      title: Text(title),
      content: content,
      actions: actions,
    );
  }
}
