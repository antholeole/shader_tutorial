import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const shaderName = 'simple';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<Shader>(
      // [FragmentProgram] takes a compiles spirv shader and outputs a flutter-usable
      // shader.
      future: FragmentProgram.compile(
        // here we pass in our compiled shader binary from assets.
        spirv:
            (await rootBundle.load('assets/shaders/$shaderName.sprv')).buffer,
      ).then((fragmentProgram) => fragmentProgram.shader(
          //shaders can take input paramaters; simple.glsl
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
