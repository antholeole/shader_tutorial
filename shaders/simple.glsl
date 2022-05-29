#version 320 es


precision highp float;

// on "out" paramater. Shaders do not communicate with eachother; instead, they run their compute, and 
// then place what they've done into an output buffer. In this case, we're placing an output called "fragColor" at
// location 0.
layout(location = 0) out vec4 fragColor;

// an "in" paramater. We're saying "get the float at position 0 and put it in variable a."
layout(location = 0) uniform float a;

void main() {
    //here, we define our out as a vector 
    fragColor = vec4(0.0, a, 0.0, 1.0);
}