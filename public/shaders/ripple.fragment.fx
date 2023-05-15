#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
// found out how to do this, just import time (it just works, with a little help in the VUE)
uniform float time;


// Output
out vec4 FragColor;

void main() {
    // Color
    FragColor = texture(image, model_uv);
    /*
    Ripple

        This filter creates a ripple effect similar to dropping a pebble in a pond
        In order to accomplish a ripple effect, implement the following equations:
            scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
                multiply by 2, then subtract 1
            calculate radius = magnitude of texture coordinate
            calculate a texture coordinate offset = texture_coordinate * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0
            calculate final texture coordinate = original_texture_coordinate + texture_coordinate_offset

    */

    vec2 UVscaled = (model_uv * 2.0) - 1.0;

    float radius = length(UVscaled);

    vec2 UVoffset = UVscaled * (sin(radius * 30.0 - time * 5.0) + 0.5) /60.0;
    vec2 finalUV = model_uv + UVoffset;

    FragColor = texture(image, finalUV);
    
}
