import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundShapes extends StatefulWidget {
  final Widget child;

  const BackgroundShapes({super.key, required this.child});

  @override
  BackgroundShapesState createState() => BackgroundShapesState();
}

class BackgroundPainter extends CustomPainter {
  final Animation<double> _animation;

  BackgroundPainter(this._animation) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.maskFilter = const MaskFilter.blur(
      BlurStyle.normal,
      30,
    );
    final circle1Offset = Offset(
        size.width -
            (200 / 2 * (1 + sin(2 * pi * _animation.value / 2 + pi / 2))),
        size.height -
            (200 / 5 * (1 + sin(2 * pi * _animation.value / 2 + pi / 2))));
    final circle2Offset = Offset(
        size.width -
            (300 / 3 * (1 + sin(2 * pi * _animation.value / 2 + pi / 3))),
        size.height -
            (300 / 4 * (1 + sin(2 * pi * _animation.value / 2 + pi / 3))));
    final circle3Offset = Offset(
        size.width -
            (200 / 2 * (1 + sin(2 * pi * _animation.value / 2 + pi / 2))),
        size.height - (200 / 6 * (1 + sin(2 * pi * _animation.value / 2))));

    final opacity = _animation.value;

    canvas.drawCircle(
        circle1Offset,
        120.0,
        paint
          ..color = const Color.fromRGBO(33, 150, 243, 1).withOpacity(opacity));
    canvas.drawCircle(
        circle2Offset, 80.0, paint..color = Colors.red.withOpacity(opacity));
    canvas.drawCircle(
        circle3Offset, 50.0, paint..color = Colors.yellow.withOpacity(opacity));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BackgroundShapesState extends State<BackgroundShapes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 600,
            width: double.maxFinite,
            child: CustomPaint(
              painter: BackgroundPainter(_controller),
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
