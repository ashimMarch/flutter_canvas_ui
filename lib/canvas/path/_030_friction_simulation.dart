import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:my_canvas/context_ext.dart';

class FrictionSimulationScreen extends StatefulWidget {
  const FrictionSimulationScreen({super.key});

  @override
  State<FrictionSimulationScreen> createState() =>
      _FrictionSimulationScreenState();
}

class _FrictionSimulationScreenState extends State<FrictionSimulationScreen>
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
          _controller.animateWith(FrictionSimulation(
            0.8,//friction between surfuce and object 0: High 1: No friction
            0, //Initial position
            300,
            constantDeceleration: 60,
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
    double halfHeight = size.height / 2;
    canvas.save();
    canvas.translate(10, 0);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(animation.value, halfHeight),
        width: 20,
        height: 20,
      ),
      Paint()..color = Colors.red,
    );
    canvas.restore();
    canvas.drawRect(
      Rect.fromPoints(
          Offset(0, halfHeight + 10), Offset(size.width, halfHeight + 20)),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(BoxPainter oldDelegate) => true;
}
