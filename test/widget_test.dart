import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:maze_game/main.dart';

void main() {
  testWidgets('main menu shows requested buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    expect(find.text('Лабиринт'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Играть'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Уровни'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Настройки'), findsOneWidget);
  });

  testWidgets('play opens the first room with movement and action controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MazeGameApp());

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
    await tester.pumpWidget(const MazeGameApp());

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
    await tester.pumpWidget(const MazeGameApp());

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

  testWidgets('levels screen lists available levels', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    await tester.tap(find.text('Уровни'));
    await tester.pumpAndSettle();

    expect(find.text('Уровни'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}
