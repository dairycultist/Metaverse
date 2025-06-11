shader_type sky;

void sky() {
	float fac = SKY_COORDS.y + 0.015 * sin((SKY_COORDS.x + TIME * 0.02) * PI * 10.0);
	COLOR = mix(vec3(0.9), vec3(0.4, 0.4, 0.47), clamp(fac * 10.0 - 4.0, 0.0, 1.0));
}
