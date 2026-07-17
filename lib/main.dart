import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Лабиринт',
      theme: ThemeData(
        textTheme: GoogleFonts.unboundedTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF3BF45),
          secondary: Color(0xFFFEFFC1),
          tertiary: Color(0xFF5643A2),
          error: Color(0xFFE53935),

          surface: Color(0xFF1B2040),
          surfaceContainer: Color.fromARGB(255, 68, 75, 122),
          surfaceContainerHigh: Color.fromARGB(255, 70, 76, 115),
          surfaceContainerHighest: Color(0xFF572A2D),

          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}
