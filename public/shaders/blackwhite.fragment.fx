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
    FragColor = texture(image, model_uv);

    // Luminence = 0.299 * Red + 0.587 * Green + 0.114 * Blue
    // Black and white images are created by assigning the luminance value to all 3 color components
    float Luminence = (0.299 * FragColor.r) + (0.587 * FragColor.g) + (0.114 * FragColor.b);

    FragColor = vec4(Luminence, Luminence, Luminence, FragColor.a);
    
}
