import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shader_toy/shader_with_stopwatch.dart';

const shaderName = 'color_change';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<FragmentProgram>(
      // [FragmentProgram] takes a compiles spirv shader and outputs a flutter-usable
      // shader.
      future: FragmentProgram.compile(
        // here we pass in our compiled shader binary from assets.
        spirv:
            (await rootBundle.load('assets/shaders/$shaderName.sprv')).buffer,
      ),
      builder: ((context, snapshot) {
        if (snapshot.data != null) {
          return ShaderWithStopwatch(fragmentProgram: snapshot.data!);
        }

        return const Center(child: CircularProgressIndicator());
      })));
}
