import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/main.dart';
import 'package:maze_game/services/progress_service.dart';
import 'package:maze_game/services/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Widget> testApp() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final settingsService = SettingsService(prefs);
  await settingsService.load();
  await settingsService.setLocale(const Locale('ru'));

  return AppDependencies(
    progressService: ProgressService(prefs),
    settingsService: settingsService,
    child: MazeGameApp(settingsService: settingsService),
  );
}

void main() {
  testWidgets('main menu shows requested buttons', (WidgetTester tester) async {
    await tester.pumpWidget(await testApp());

    expect(find.text('Лабиринт'), findsOneWidget);
    expect(find.text('Играть'), findsOneWidget);
    expect(find.text('Уровни'), findsOneWidget);
    expect(find.text('Настройки'), findsOneWidget);
  });

  testWidgets('play opens the first room with movement and action controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(await testApp());

    await tester.tap(find.text('Играть'));
    await tester.pumpAndSettle();

    expect(find.text('Уровень 1'), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_left_rounded), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_right_rounded), findsOneWidget);
    expect(find.byIcon(Icons.login), findsOneWidget);
  });

  testWidgets('movement switches between doors before action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(await testApp());

    await tester.tap(find.text('Играть'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.keyboard_arrow_right_rounded));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.login));
    await tester.pumpAndSettle();

    expect(find.text('Уровень пройден!'), findsNothing);
    expect(find.text('Уровень 1'), findsOneWidget);
  });

  testWidgets('level is completed only after entering the exit room', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(await testApp());

    await tester.tap(find.text('Играть'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.login));
    await tester.pump();
    expect(find.text('Уровень пройден!'), findsNothing);

    await tester.tap(find.byIcon(Icons.login));
    await tester.pump();
    expect(find.text('Уровень пройден!'), findsNothing);

    await tester.tap(find.byIcon(Icons.login));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Уровень пройден!'), findsOneWidget);
    expect(find.textContaining('Ты нашёл выход'), findsOneWidget);
  });

  testWidgets('levels screen lists available levels', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(await testApp());

    await tester.tap(find.text('Уровни'));
    await tester.pumpAndSettle();

    expect(find.text('Уровни'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}
