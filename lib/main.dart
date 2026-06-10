import 'package:flutter/material.dart';

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

class DoorMazeLevel {
  const DoorMazeLevel({
    required this.title,
    required this.description,
    required this.rooms,
    required this.startRoomId,
    required this.requiredDoorIds,
  });

  final String title;
  final String description;
  final List<MazeRoom> rooms;
  final String startRoomId;
  final Set<String> requiredDoorIds;

  MazeRoom roomById(String id) => rooms.firstWhere((room) => room.id == id);
}

class MazeRoom {
  const MazeRoom({
    required this.id,
    required this.name,
    required this.hint,
    required this.doors,
  });

  final String id;
  final String name;
  final String hint;
  final List<MazeDoor> doors;
}

class MazeDoor {
  const MazeDoor({
    required this.id,
    required this.label,
    required this.color,
    required this.targetRoomId,
  });

  final String id;
  final String label;
  final Color color;
  final String targetRoomId;
}

const List<DoorMazeLevel> levels = [
  DoorMazeLevel(
    title: 'Уровень 1: Три двери',
    description: 'Обучающий лабиринт из 3 комнат.',
    startRoomId: 'hall',
    requiredDoorIds: {'hall_red', 'storage_green'},
    rooms: [
      MazeRoom(
        id: 'hall',
        name: 'Синий зал',
        hint: 'Красная дверь ведёт глубже, синяя возвращает назад.',
        doors: [
          MazeDoor(
            id: 'hall_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'storage',
          ),
          MazeDoor(
            id: 'hall_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'hall',
          ),
        ],
      ),
      MazeRoom(
        id: 'storage',
        name: 'Кладовая',
        hint: 'Зелёная дверь отмечена как нужная для прохождения.',
        doors: [
          MazeDoor(
            id: 'storage_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'exit',
          ),
          MazeDoor(
            id: 'storage_purple',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'hall',
          ),
        ],
      ),
      MazeRoom(
        id: 'exit',
        name: 'Комната выхода',
        hint: 'Если все нужные двери открыты, уровень завершится.',
        doors: [
          MazeDoor(
            id: 'exit_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'hall',
          ),
        ],
      ),
    ],
  ),
  DoorMazeLevel(
    title: 'Уровень 2: Цветная петля',
    description: '5 комнат и несколько обманных переходов.',
    startRoomId: 'square',
    requiredDoorIds: {'square_green', 'garden_red', 'tower_yellow'},
    rooms: [
      MazeRoom(
        id: 'square',
        name: 'Площадь',
        hint: 'Некоторые двери закольцованы и путают путь.',
        doors: [
          MazeDoor(
            id: 'square_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'garden',
          ),
          MazeDoor(
            id: 'square_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'cellar',
          ),
          MazeDoor(
            id: 'square_orange',
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'garden',
        name: 'Сад',
        hint: 'Красная дверь обязательна, но ведёт не к выходу.',
        doors: [
          MazeDoor(
            id: 'garden_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'tower',
          ),
          MazeDoor(
            id: 'garden_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'tower',
        name: 'Башня',
        hint: 'Жёлтая дверь завершает цепочку нужных дверей.',
        doors: [
          MazeDoor(
            id: 'tower_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'exit2',
          ),
          MazeDoor(
            id: 'tower_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'cellar',
          ),
        ],
      ),
      MazeRoom(
        id: 'cellar',
        name: 'Подвал',
        hint: 'Отсюда легко вернуться в начало.',
        doors: [
          MazeDoor(
            id: 'cellar_purple',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'garden',
          ),
          MazeDoor(
            id: 'cellar_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'exit2',
        name: 'Тихий выход',
        hint: 'Проверьте прогресс нужных дверей.',
        doors: [
          MazeDoor(
            id: 'exit2_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'tower',
          ),
        ],
      ),
    ],
  ),
  DoorMazeLevel(
    title: 'Уровень 3: Большой лабиринт',
    description: '7 комнат — больше комнат, выше сложность.',
    startRoomId: 'atrium',
    requiredDoorIds: {'atrium_red', 'library_violet', 'bridge_green', 'forge_blue'},
    rooms: [
      MazeRoom(
        id: 'atrium',
        name: 'Атриум',
        hint: 'Красная дверь — первый верный шаг.',
        doors: [
          MazeDoor(
            id: 'atrium_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'library',
          ),
          MazeDoor(
            id: 'atrium_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'forge',
          ),
        ],
      ),
      MazeRoom(
        id: 'library',
        name: 'Библиотека',
        hint: 'Фиолетовая дверь нужна для победы.',
        doors: [
          MazeDoor(
            id: 'library_violet',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'bridge',
          ),
          MazeDoor(
            id: 'library_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'atrium',
          ),
          MazeDoor(
            id: 'library_orange',
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 'observatory',
          ),
        ],
      ),
      MazeRoom(
        id: 'bridge',
        name: 'Мост',
        hint: 'Зелёная дверь открывает путь к кузнице.',
        doors: [
          MazeDoor(
            id: 'bridge_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'forge',
          ),
          MazeDoor(
            id: 'bridge_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'vault',
          ),
        ],
      ),
      MazeRoom(
        id: 'forge',
        name: 'Кузница',
        hint: 'Синяя дверь — последняя обязательная.',
        doors: [
          MazeDoor(
            id: 'forge_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'sanctuary',
          ),
          MazeDoor(
            id: 'forge_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'library',
          ),
        ],
      ),
      MazeRoom(
        id: 'observatory',
        name: 'Обсерватория',
        hint: 'Красивая, но не обязательная комната.',
        doors: [
          MazeDoor(
            id: 'observatory_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'bridge',
          ),
        ],
      ),
      MazeRoom(
        id: 'vault',
        name: 'Хранилище',
        hint: 'Эта петля сбивает с маршрута.',
        doors: [
          MazeDoor(
            id: 'vault_violet',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'atrium',
          ),
          MazeDoor(
            id: 'vault_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'observatory',
          ),
        ],
      ),
      MazeRoom(
        id: 'sanctuary',
        name: 'Святилище',
        hint: 'Все нужные двери здесь приводят к победе.',
        doors: [
          MazeDoor(
            id: 'sanctuary_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'atrium',
          ),
        ],
      ),
    ],
  ),
];

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B2040), Color(0xFF101321)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  stretch: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.door_sliding, size: 92, color: Color(0xFFF3BF45)),
                    const SizedBox(height: 18),
                    Text(
                      'Лабиринт дверей',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Переключайся между дверями, стой под выбранной дверью и найди правильную цепочку.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 42),
                    MenuButton(
                      icon: Icons.play_arrow_rounded,
                      label: 'Играть',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => GameScreen(level: levels.first)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    MenuButton(
                      icon: Icons.map_rounded,
                      label: 'Уровни',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => const LevelsScreen()),
                      ),
                    ),
                    const SizedBox(height: 14),
                    MenuButton(
                      icon: Icons.settings_rounded,
                      label: 'Настройки',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => const SettingsScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
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
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      icon: Icon(icon, size: 28),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Уровни')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: levels.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final level = levels[index];
          return Card(
            elevation: 8,
            color: const Color(0xFF202642),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text('${index + 1}'),
              ),
              title: Text(level.title, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text('${level.description}\nКомнат: ${level.rooms.length}'),
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => GameScreen(level: level)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showHints = true;
  double speed = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SwitchListTile(
            value: showHints,
            title: const Text('Показывать подсказки'),
            subtitle: const Text('Подсказки помогают понять, какие двери могут быть важными.'),
            onChanged: (value) => setState(() => showHints = value),
          ),
          const SizedBox(height: 18),
          Text('Скорость игрока: ${speed.round()}', style: Theme.of(context).textTheme.titleMedium),
          Slider(
            min: 8,
            max: 32,
            divisions: 6,
            value: speed,
            label: speed.round().toString(),
            onChanged: (value) => setState(() => speed = value),
          ),
          const SizedBox(height: 28),
          const Card(
            color: Color(0xFF202642),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Управление в игре: кнопки влево и вправо переключают персонажа строго между дверями. Нажми действие, чтобы войти в выбранную дверь.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({required this.level, super.key});

  final DoorMazeLevel level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String roomId;
  final Set<String> openedRequiredDoors = <String>{};
  int selectedDoorIndex = 0;
  String message = 'Выбери дверь и нажми действие.';

  MazeRoom get room => widget.level.roomById(roomId);

  @override
  void initState() {
    super.initState();
    roomId = widget.level.startRoomId;
  }

  void move(int direction) {
    if (room.doors.isEmpty) {
      setState(() => message = 'В этой комнате нет дверей.');
      return;
    }

    final nextIndex = (selectedDoorIndex + direction).clamp(0, room.doors.length - 1).toInt();
    setState(() {
      selectedDoorIndex = nextIndex;
      final selectedDoor = room.doors[selectedDoorIndex];
      message = 'Ты стоишь под дверью: ${selectedDoor.label}.';
    });
  }

  void useAction() {
    final door = selectedDoor;
    if (door == null) {
      setState(() => message = 'В этой комнате нет дверей.');
      return;
    }

    final isRequired = widget.level.requiredDoorIds.contains(door.id);
    setState(() {
      if (isRequired) {
        openedRequiredDoors.add(door.id);
      }
      roomId = door.targetRoomId;
      selectedDoorIndex = 0;
      message = isRequired ? 'Нужная дверь открыта: ${door.label}!' : 'Ты вошёл в дверь: ${door.label}.';
    });

    if (openedRequiredDoors.length == widget.level.requiredDoorIds.length) {
      Future<void>.delayed(const Duration(milliseconds: 250), _showWinDialog);
    }
  }

  MazeDoor? get selectedDoor {
    if (room.doors.isEmpty) {
      return null;
    }
    final safeIndex = selectedDoorIndex.clamp(0, room.doors.length - 1).toInt();
    return room.doors[safeIndex];
  }

  double get playerX {
    if (room.doors.isEmpty) {
      return 0.5;
    }
    final safeIndex = selectedDoorIndex.clamp(0, room.doors.length - 1).toInt();
    return _doorPosition(safeIndex, room.doors.length);
  }

  double _doorPosition(int index, int count) => (index + 1) / (count + 1);

  void _showWinDialog() {
    if (!mounted) {
      return;
    }
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Уровень пройден!'),
        content: Text('Ты нашёл все нужные двери в уровне «${widget.level.title}». Комнат: ${widget.level.rooms.length}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Остаться'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('В меню'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = openedRequiredDoors.length / widget.level.requiredDoorIds.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.level.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('${room.name} • ${widget.level.rooms.length} комн.')),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(
                      minHeight: 12,
                      value: progress,
                      backgroundColor: Colors.white12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Нужные двери: ${openedRequiredDoors.length}/${widget.level.requiredDoorIds.length}'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: CustomPaint(
                            painter: RoomPainter(roomName: room.name),
                          ),
                        ),
                        for (var index = 0; index < room.doors.length; index++)
                          DoorWidget(
                            door: room.doors[index],
                            isRequired: widget.level.requiredDoorIds.contains(room.doors[index].id),
                            isOpened: openedRequiredDoors.contains(room.doors[index].id),
                            left: constraints.maxWidth * _doorPosition(index, room.doors.length) - 34,
                          ),
                        Positioned(
                          left: constraints.maxWidth * playerX - 22,
                          bottom: 74,
                          child: const PlayerWidget(),
                        ),
                        Positioned(
                          left: 18,
                          right: 18,
                          bottom: 12,
                          child: _GameMessage(text: message, hint: room.hint),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 20),
              child: Row(
                children: [
                  ControlButton(
                    icon: Icons.keyboard_arrow_left_rounded,
                    label: 'Влево',
                    onPressed: () => move(-1),
                  ),
                  const SizedBox(width: 14),
                  ControlButton(
                    icon: Icons.keyboard_arrow_right_rounded,
                    label: 'Вправо',
                    onPressed: () => move(1),
                  ),
                  const Spacer(),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFF3BF45),
                      foregroundColor: const Color(0xFF151515),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    ),
                    onPressed: useAction,
                    icon: const Icon(Icons.touch_app_rounded),
                    label: const Text('Действие'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoorWidget extends StatelessWidget {
  const DoorWidget({
    required this.door,
    required this.isRequired,
    required this.isOpened,
    required this.left,
    super.key,
  });

  final MazeDoor door;
  final bool isRequired;
  final bool isOpened;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: 54,
      child: Column(
        children: [
          Container(
            width: 68,
            height: 112,
            decoration: BoxDecoration(
              color: door.color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
              border: Border.all(color: Colors.white.withValues(alpha: 0.82), width: 3),
              boxShadow: [
                BoxShadow(color: door.color.withValues(alpha: 0.45), blurRadius: 18, spreadRadius: 2),
              ],
            ),
            child: Icon(
              isOpened ? Icons.check_circle_rounded : Icons.circle,
              color: Colors.white.withValues(alpha: 0.86),
            ),
          ),
          const SizedBox(height: 8),
          Text(door.label, style: const TextStyle(fontWeight: FontWeight.w700)),
          if (isRequired)
            Text(
              isOpened ? 'открыта' : 'нужная',
              style: TextStyle(color: isOpened ? Colors.greenAccent : Colors.amberAccent, fontSize: 12),
            ),
        ],
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(color: Color(0xFFFFD2A6), shape: BoxShape.circle),
          child: const Icon(Icons.face_rounded, color: Color(0xFF4A2B22), size: 24),
        ),
        Container(
          width: 44,
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0xFF64D2FF),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
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

    final roomRect = RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(28));
    canvas.drawRRect(roomRect, wallPaint);
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.68, size.width, size.height * 0.32), floorPaint);

    for (var x = -size.width; x < size.width * 2; x += 44) {
      canvas.drawLine(Offset(x.toDouble(), size.height * 0.68), Offset(x + size.width * 0.26, size.height), linePaint);
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
  bool shouldRepaint(covariant RoomPainter oldDelegate) => oldDelegate.roomName != roomName;
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

class _GameMessage extends StatelessWidget {
  const _GameMessage({required this.text, required this.hint});

  final String text;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF101321).withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(hint, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
