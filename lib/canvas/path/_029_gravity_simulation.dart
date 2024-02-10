import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:my_canvas/context_ext.dart';

class GravitySimulationScreen extends StatefulWidget {
  const GravitySimulationScreen({super.key});

  @override
  State<GravitySimulationScreen> createState() =>
      _GravitySimulationScreenState();
}

class _GravitySimulationScreenState extends State<GravitySimulationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double height;
  late double width;

  @override
  void initState() {
    super.initState();
    //To create Simulation we need to use unboundedAnimation
    _controller = AnimationController.unbounded(
      vsync: this,
    )..addListener(() {
        print(_controller.value);
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    height =
        context.mqHeight - (MediaQuery.maybePaddingOf(context)?.vertical ?? 0);
    width = context.mqWidth;

    print(
      'mqHeight: ${context.mqHeight} mqvertical: ${MediaQuery.maybePaddingOf(context)?.vertical}  ${context.mqHeight} devicePixelRatio: ${MediaQuery.of(context).devicePixelRatio}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18001D),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: CustomPaint(
            size: Size(width, height),
            painter: BoxPainter(animation: _controller),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateWith(GravitySimulation(
            30,
            0,
            height - 20,
            20,
          ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BoxPainter extends CustomPainter {
  final AnimationController animation;

  BoxPainter({required this.animation}) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, 10);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, animation.value),
        width: 20,
        height: 20,
      ),
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(BoxPainter oldDelegate) => true;
}
