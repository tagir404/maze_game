import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:maze_game/main.dart';

void main() {
  testWidgets('main menu shows requested buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    expect(find.text('Лабиринт дверей'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Играть'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Уровни'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Настройки'), findsOneWidget);
  });

  testWidgets('play opens the first room with movement and action controls', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    await tester.tap(find.text('Играть'));
    await tester.pumpAndSettle();

    expect(find.text('Уровень 1: Три двери'), findsOneWidget);
    expect(find.text('Синий зал • 3 комн.'), findsOneWidget);
    expect(find.text('Влево'), findsOneWidget);
    expect(find.text('Вправо'), findsOneWidget);
    expect(find.text('Действие'), findsOneWidget);
    expect(find.text('Нужные двери: 0/2'), findsOneWidget);
  });

  testWidgets('movement switches between doors before action', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    await tester.tap(find.text('Играть'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Вправо'));
    await tester.pump();

    expect(find.text('Ты стоишь под дверью: Синяя.'), findsOneWidget);

    await tester.tap(find.text('Действие'));
    await tester.pumpAndSettle();

    expect(find.text('Синий зал • 3 комн.'), findsOneWidget);
    expect(find.text('Ты вошёл в дверь: Синяя.'), findsOneWidget);
    expect(find.text('Нужные двери: 0/2'), findsOneWidget);
  });

  testWidgets('levels screen lists level complexity by room count', (WidgetTester tester) async {
    await tester.pumpWidget(const MazeGameApp());

    await tester.tap(find.text('Уровни'));
    await tester.pumpAndSettle();

    expect(find.text('Уровни'), findsOneWidget);
    expect(find.textContaining('Комнат: 3'), findsOneWidget);
    expect(find.textContaining('Комнат: 5'), findsOneWidget);
    expect(find.textContaining('Комнат: 7'), findsOneWidget);
  });
}
