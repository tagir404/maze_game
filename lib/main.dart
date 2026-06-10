import 'package:flutter/material.dart';
import 'package:maze_game/screens/main_menu_screen.dart';

void main() {
  runApp(const MazeGameApp());
}

class MazeGameApp extends StatelessWidget {
  const MazeGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лабиринт дверей',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C4BF4),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF101321),
      ),
      home: const MainMenuScreen(),
    );
  }
}

class RoomPainter extends CustomPainter {
  const RoomPainter({required this.roomName});

  final String roomName;

  @override
  void paint(Canvas canvas, Size size) {
    final wallPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF29345E), Color(0xFF15192E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Offset.zero & size);
    final floorPaint = Paint()..color = const Color(0xFF22263D);
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 2;

    final roomRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(28),
    );
    canvas.drawRRect(roomRect, wallPaint);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.68, size.width, size.height * 0.32),
      floorPaint,
    );

    for (var x = -size.width; x < size.width * 2; x += 44) {
      canvas.drawLine(
        Offset(x.toDouble(), size.height * 0.68),
        Offset(x + size.width * 0.26, size.height),
        linePaint,
      );
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: roomName,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.10),
          fontSize: 42,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width - 40);
    textPainter.paint(canvas, const Offset(22, 18));
  }

  @override
  bool shouldRepaint(covariant RoomPainter oldDelegate) =>
      oldDelegate.roomName != roomName;
}

class ControlButton extends StatelessWidget {
  const ControlButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 28),
      label: Text(label),
    );
  }
}
