import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  double left = 0;
  double top = 0;
  double withFigure = 100;
  double heightFigure = 100;
  bool isCircle = false;
  bool isAnimation = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    left = (widget.widthMedia - withFigure) / 2;
    top = (widget.heightMedia - heightFigure) / 2;
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
              turns: animation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: BoxDecoration(
                    color: isCircle ? Colors.blue : Colors.amber,
                    borderRadius: isCircle
                        ? BorderRadius.circular(30)
                        : BorderRadius.circular(0)),
                width: 100,
                height: 100,
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCircle = !isCircle;
                });
              },
              onLongPress: () {
                isAnimation = !isAnimation;

                isAnimation ? controller.stop() : controller.repeat();
              },
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
    controller.dispose();
    super.dispose();
  }
}
