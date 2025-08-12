shader_type sky;

uniform vec3 top : source_color;
uniform vec3 bottom : source_color;

float hash(vec2 p) {
  return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453123);
}

void sky() {
	float fac = clamp(SKY_COORDS.y + hash(SKY_COORDS.xy) * 0.1, 0., 1.);
	COLOR = mix(top, bottom, fac);
}
