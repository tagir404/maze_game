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
