import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shader_toy/shader_painter.dart';

class FragCoordShader extends StatelessWidget {
  final FragmentProgram fragmentProgram;

  const FragCoordShader({super.key, required this.fragmentProgram});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChangingColorShaderPainter(fragmentProgram.shader(
          floatUniforms: Float32List.fromList([
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width
      ]))),
    );
  }
}
