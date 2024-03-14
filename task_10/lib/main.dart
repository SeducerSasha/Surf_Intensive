import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Возьмем размеры экрана, чтобы при построении построить фигуру в центре.
    final double widthMedia = MediaQuery.of(context).size.width;
    final double heightMedia = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
          title: 'GestureMaster',
          heightMedia: heightMedia,
          widthMedia: widthMedia),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.widthMedia,
      required this.heightMedia});

  final String title;
  final double widthMedia;
  final double heightMedia;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  /// Инициализируем переменные.
  /// Отступ слева для хранения координат фигуры при перемещении.
  double left = 0;

  /// отступ сверху для хранения координат фигуры при перемещении.
  double top = 0;

  /// Определяем размеры фигуры.
  double withFigure = 100;
  double heightFigure = 100;

  /// Фигура может быть либо прямоугольником, либо кругом.
  bool isCircle = false;

  /// Включена ли анимация.
  bool isAnimation = false;

  /// Определяем переменные для анимации.
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    /// Присваиваем переменным начальное положение фигуры.
    left = (widget.widthMedia - withFigure) / 2;
    top = (widget.heightMedia - heightFigure) / 2;

    /// Настраиваем поведение анимации.
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: RotationTransition(
              /// Виджет для анимации.
              turns: animation,
              child: AnimatedContainer(
                /// Виджет для трансформации одной фигуры в другую.
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: BoxDecoration(

                    /// Меняем цвет в зависимости от вида фигуры
                    gradient: LinearGradient(
                        colors: isCircle
                            ? [Colors.blue, Colors.lime]
                            : [Colors.amber, Colors.red]),

                    /// Меняем фигуру.
                    borderRadius: isCircle
                        ? BorderRadius.circular(45)
                        : BorderRadius.circular(0)),
                width: 100,
                height: 100,
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              /// Действие при нажатии. Меняем переменную (круг на прямоугольник и обратно).
              /// И перерисовываем экран.
              onTap: () {
                setState(() {
                  isCircle = !isCircle;
                });
              },

              /// Включам или выключаем анимацию фигуры
              onLongPress: () {
                isAnimation = !isAnimation;

                isAnimation ? controller.stop() : controller.repeat();
              },

              /// Отслеживаем изменения положения фигуры, изменяем переменные и перерисовываем экран
              onPanUpdate: (details) {
                setState(() {
                  left = left + details.delta.dx;
                  top = top + details.delta.dy;
                  if (left < 0) {
                    left = 0;
                  }
                  if (top < 0) {
                    top = 0;
                  }
                  if (left + withFigure > widget.widthMedia) {
                    left = widget.widthMedia - withFigure;
                  }
                  if (top + heightFigure > widget.heightMedia) {
                    top = widget.heightMedia - heightFigure;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    /// Не забываем уничтожить контроллер анимации.
    controller.dispose();
    super.dispose();
  }
}
