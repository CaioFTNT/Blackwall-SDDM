#version 440

layout(binding = 1) uniform sampler2D source;
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

void main() {
    vec2 uv = qt_TexCoord0;
    
    float notchUV = 10.0 / 250.0; 
    
    // The notch starts 1/6th down from the top, and 1/6th up from the bottom
    float topY = 1.0 / 6.0;
    float bottomY = 5.0 / 6.0;

    // Top-left diagonal entry line:
    if (uv.y > topY && uv.y < topY + notchUV) {
        float sliceLine = uv.y - topY;
        if (uv.x < sliceLine) {
            discard;
        }
    }
    
    // Inner vertical inset wall:
    if (uv.y >= topY + notchUV && uv.y <= bottomY - notchUV) {
        if (uv.x < notchUV) {
            discard;
        }
    }

    // Bottom-left diagonal exit line:
    if (uv.y > bottomY - notchUV && uv.y < bottomY) {
        float sliceLine = bottomY - uv.y;
        if (uv.x < sliceLine) {
            discard;
        }
    }

    fragColor = texture(source, uv);
}