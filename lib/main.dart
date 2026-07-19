import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/l10n/app_localizations.dart';
import 'package:maze_game/screens/main_menu_screen.dart';
import 'package:maze_game/services/audio_service.dart';
import 'package:maze_game/services/progress_service.dart';
import 'package:maze_game/services/settings_service.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await audioService.init();

  final prefs = await SharedPreferences.getInstance();
  final progressService = ProgressService(prefs);
  final settingsService = SettingsService(prefs);
  await settingsService.load();
  await walletService.init(prefs);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await SystemChrome.setPreferredOrientations(const [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    AppDependencies(
      progressService: progressService,
      settingsService: settingsService,
      child: MazeGameApp(settingsService: settingsService),
    ),
  );
}

class MazeGameApp extends StatelessWidget {
  MazeGameApp({SettingsService? settingsService, super.key})
    : settingsService = settingsService ?? SettingsService(null);

  final SettingsService settingsService;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsService,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maze',
        locale: settingsService.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: AppLocalizations.localeResolutionCallback,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: settingsService.themeMode,
        theme: _buildTheme(Brightness.light),
        darkTheme: _buildTheme(Brightness.dark),
        home: const MainMenuScreen(),
      ),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors = isDark
        ? const ColorScheme.dark(
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
          )
        : const ColorScheme.light(
            primary: Color(0xFF8A5A00),
            secondary: Color(0xFF6D5D00),
            tertiary: Color(0xFF5643A2),
            error: Color(0xFFE53935),
            surface: Color(0xFFFFF8E8),
            surfaceContainer: Color(0xFFFFE8B5),
            surfaceContainerHigh: Color(0xFFFFD98A),
            surfaceContainerHighest: Color(0xFFFFC857),
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Color(0xFF242018),
          );

    return ThemeData(
      textTheme: GoogleFonts.unboundedTextTheme().apply(
        bodyColor: colors.onSurface,
        displayColor: colors.onSurface,
      ),
      colorScheme: colors,
      useMaterial3: true,
    );
  }
}
