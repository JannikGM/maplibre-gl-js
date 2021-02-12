varying vec2 v_pos;

varying mediump vec4 v_outline_color;

void main() {
    float dist = length(v_pos - gl_FragCoord.xy);
    float alpha = 1.0 - smoothstep(0.0, 1.0, dist);
    gl_FragColor = v_outline_color * alpha;

#ifdef OVERDRAW_INSPECTOR
    gl_FragColor = vec4(1.0);
#endif
}
