shader_type sky;

uniform vec3 top : source_color;
uniform vec3 bottom : source_color;

uniform float star_smallness : hint_range(200., 2000.) = 2000.;
uniform float star_rarity : hint_range(.98, .999) = .999;

float hash(vec2 p) {
  return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453123);
}

void sky() {
	float fac = clamp(SKY_COORDS.y + hash(SKY_COORDS.xy) * 0.1, 0., 1.);

	float star_hash = hash(vec2(
		floor(SKY_COORDS.x * star_smallness) / star_smallness,
		floor(SKY_COORDS.y * star_smallness) / star_smallness
	));

	if (star_hash > star_rarity) {
		COLOR = vec3((star_hash - star_rarity) / (1. - star_rarity));
	} else {
		COLOR = mix(top, bottom, fac);
	}
}
