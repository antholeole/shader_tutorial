import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shader_toy/square_shader.dart';

const shaderName = 'color_spaces';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: FutureBuilder<FragmentProgram>(
        // [FragmentProgram] takes a compiles spirv shader and outputs a flutter-usable
        // shader.
        future: FragmentProgram.compile(
          // here we pass in our compiled shader binary from assets.
          spirv:
              (await rootBundle.load('assets/shaders/$shaderName.sprv')).buffer,
        ),
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return FragCoordShader(fragmentProgram: snapshot.data!);
          }

          return const Center(child: CircularProgressIndicator());
        })),
  ));
}
