#version 320 es
precision highp float;

layout(location = 0) out vec4 fragColor;

layout(location = 0) uniform float time;

void main() {
	fragColor = vec4(abs(sin(time)), abs(cos(time - 1.0)), 0.0, 1.0);
}