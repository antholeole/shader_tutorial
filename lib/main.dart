import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Ensure bindings are initialized otherwise we can't user rootBundle.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<Shader>(
      future: FragmentProgram.compile(
        spirv: (await rootBundle.load('assets/shaders/simple.sprv')).buffer,
      ).then((fragmentProgram) => fragmentProgram.shader(
          floatUniforms: Float32List.fromList(<double>[15]))),
      builder: ((context, snapshot) {
        if (snapshot.data != null) {
          return CustomPaint(painter: ShaderPainter(snapshot.data!));
        }

        return const Center(child: CircularProgressIndicator());
      })));
}

class ShaderPainter extends CustomPainter {
  final Shader shader;

  ShaderPainter(this.shader);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 100, 100),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
