varying vec3 v_data;

varying mediump vec4 v_color;
varying mediump vec4 v_stroke_color;

#pragma mapbox: define mediump float radius
#pragma mapbox: define lowp float blur
#pragma mapbox: define mediump float stroke_width

void main() {
    #pragma mapbox: initialize mediump float radius
    #pragma mapbox: initialize lowp float blur
    #pragma mapbox: initialize mediump float stroke_width

    vec2 extrude = v_data.xy;
    float extrude_length = length(extrude);

    lowp float antialiasblur = v_data.z;
    float antialiased_blur = -max(blur, antialiasblur);

    float opacity_t = smoothstep(0.0, antialiased_blur, extrude_length - 1.0);

    float color_t = stroke_width < 0.01 ? 0.0 : smoothstep(
        antialiased_blur,
        0.0,
        extrude_length - radius / (radius + stroke_width)
    );

    gl_FragColor = opacity_t * mix(v_color, v_stroke_color, color_t);

#ifdef OVERDRAW_INSPECTOR
    gl_FragColor = vec4(1.0);
#endif
}
