import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.onPressed,
    required this.child,
    this.padding,
    super.key,
  });

  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsets? padding;

  @override
  State<AppButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<AppButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 90),
        scale: _pressed ? 0.96 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          transform: Matrix4.translationValues(
            _pressed ? 4 : 0,
            _pressed ? 6 : 0,
            0,
          ),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              if (!_pressed)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(4, 6),
                ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
