shader_type sky;

uniform vec3 top : source_color;
uniform vec3 bottom : source_color;
uniform float c : hint_range(0., 1.) = 0.;
uniform float cel_size = 800.;

float hash(vec2 p) {
  return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453123);
}

void sky() {
	float x = SKY_COORDS.x;
	float y = abs(SKY_COORDS.y - 0.5) * 2.0;
	
	y = y + 1. - sqrt(1. - y * y);
	
	// so cels shrink slowly then accelerate
	float d = pow(c, 2);

	float cel_unique_a = hash(
		vec2(
			float(int(x * cel_size + d * 30.) / 60) / 60.,
			float(int(y * cel_size + d * 30.) / 240) / 60.
		)
	);

	float cel_unique_b = hash(
		vec2(
			float(int((x + 2.) * cel_size + d * 30.) / 60) / 60.,
			float(int((y + 4.) * cel_size + d * 30.) / 240) / 60.
		)
	);
	
	// so each cel shrinks at a different rate
	float e = pow(c, 1. + mod(cel_unique_b, 2.));

	if (
		   mod(x * cel_size + e * 30., 60) / 60. < e
		|| mod(y * cel_size + e * 120., 240) / 60. < e * 4.) {
		COLOR = vec3(1.);
	} else {
		float fac = clamp(SKY_COORDS.y + hash(vec2(SKY_COORDS.x, SKY_COORDS.y)) * 0.1, 0., 1.);
		COLOR = mix(mix(top, bottom, fac), vec3(cel_unique_a, cel_unique_b, 1.0), c);
	}
}
