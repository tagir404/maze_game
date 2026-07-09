import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/screens/main_menu_screen.dart';
import 'package:maze_game/services/audio_service.dart';
import 'package:maze_game/services/progress_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await audioService.init();

  final prefs = await SharedPreferences.getInstance();
  final progressService = ProgressService(prefs);

  await SystemChrome.setPreferredOrientations(const [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    AppDependencies(
      progressService: progressService,
      child: const MazeGameApp(),
    ),
  );
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
          seedColor: const Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF101321),
      ),
      home: const MainMenuScreen(),
    );
  }
}
