shader_type sky;

uniform sampler2D panorama: source_color;
uniform float c : hint_range(0., 1.) = 0.;
uniform int cel_count : hint_range(0, 1000) = 12;

float hash(vec2 p) {
  return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453123);
}

void sky() {
	float x = SKY_COORDS.x;
	float y = abs(SKY_COORDS.y - 0.5) * 2.0;
	
	float cel_size = 6. * float(cel_count);
	
	// correct for distortion at the top/bottom
	y = y + 1. - sqrt(1. - y * y);
	
	// so cels shrink slowly then accelerate
	float d = pow(c, 2);

	float cel_unique_a = hash(
		vec2(
			float(int(x * cel_size + d * 3.) / 6) / 6.,
			float(int(y * cel_size + d * 3.) / 24) / 6.
		)
	);

	float cel_unique_b = hash(
		vec2(
			float(int((x + 2.) * cel_size + d * 3.) / 6) / 6.,
			float(int((y + 4.) * cel_size + d * 3.) / 24) / 6.
		)
	);
	
	// so each cel shrinks at a different rate
	float e = pow(c, 1. + mod(cel_unique_b, 2.));

	if (
		   mod(x * cel_size + e * 3., 6) / 6. < e
		|| mod(y * cel_size + e * 12., 24) / 6. < e * 4.) {
		COLOR = vec3(1.);
	} else {
		COLOR = mix(texture(panorama, SKY_COORDS.xy).rgb, vec3(cel_unique_a, cel_unique_b, 1.0), c);
	}
}
