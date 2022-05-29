#version 320 es
precision highp float;

layout(location = 0) out vec4 fragColor;

layout(location = 0) uniform float x_res;
layout(location = 1) uniform float y_res;

void main() {
	float x = gl_FragCoord.xy.x / x_res;
    float y = gl_FragCoord.xy.y / y_res;

	fragColor = vec4(x, y, 0.0, 1.0);
}