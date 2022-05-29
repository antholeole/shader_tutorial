import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shader_toy/shader_painter.dart';

class ShaderWithStopwatch extends StatefulWidget {
  final FragmentProgram fragmentProgram;

  const ShaderWithStopwatch({super.key, required this.fragmentProgram});

  @override
  State<ShaderWithStopwatch> createState() => _ShaderWithStopwatchState();
}

class _ShaderWithStopwatchState extends State<ShaderWithStopwatch> {
  late Timer _timer;
  double tick = 0;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        tick += 0.01;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChangingColorShaderPainter(widget.fragmentProgram
          .shader(floatUniforms: Float32List.fromList([tick]))),
    );
  }
}
