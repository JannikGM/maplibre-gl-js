uniform sampler2D u_texture;

varying vec2 v_tex;
varying float v_fade_opacity;

varying lowp float v_combined_opacity;

void main() {
    gl_FragColor = texture2D(u_texture, v_tex) * v_combined_opacity;

#ifdef OVERDRAW_INSPECTOR
    gl_FragColor = vec4(1.0);
#endif
}
