#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    // Maybe do literally a R G or B thing, turn the colors
    FragColor = texture(image, model_uv);

    float maxColor = max(FragColor.r, FragColor.g, FragColor.b);
    FragColor = vec4(maxColor, maxColor, maxColor, FragColor.a);

}
