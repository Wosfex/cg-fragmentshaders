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

    // 383 is the divider between dark and light
    // float colorTotal = (FragColor.r + FragColor.g + FragColor.b);
    // if(colorTotal >= 383.0){
    //     FragColor.b = round(FragColor.b * 2.0) / 2.0;
    // }else{
    //     FragColor.r = round(FragColor.r * 2.0) / 2.0;
    // }

    // Dividing the image multiple times, need to grab UVs that are modified.

    // Don't shift this in the y, makes an after-effect.
    vec4 yImage = texture(image, model_uv - vec2(0.5, 0.0)); 

    vec4 yImageChanged = texture(image, model_uv + vec2(0.5, 0.5)); 

    // Create anaglyph effect
    FragColor = vec4(yImageChanged.r, yImage.g, yImageChanged.b, 1.0);
}
