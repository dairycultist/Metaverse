shader_type sky;

uniform vec3 top : source_color;
uniform vec3 bottom : source_color;
uniform float c : hint_range(0., 1.) = 0.;
uniform float cel_size = 800.;

float hash(vec2 p) {
  return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453123);
}

void sky() {
	float fac = clamp(SKY_COORDS.y + hash(SKY_COORDS.xy) * 0.1, 0., 1.);

	//SKY_COORDS.xy

	float cel_unique_a = hash(
		vec2(
			float(int(SKY_COORDS.x * cel_size + c * 30.) / 60) / 60.,
			float(int(SKY_COORDS.y * cel_size + c * 30.) / 120) / 60.
		)
	);

	float cel_unique_b = hash(
		vec2(
			float(int((SKY_COORDS.x + 2.1) * cel_size + c * 30.) / 60) / 60.,
			float(int((SKY_COORDS.y + 4.5) * cel_size + c * 30.) / 120) / 60.
		)
	);

	if (
		   float(int(SKY_COORDS.x * cel_size + c * 30.) % 60) / 60. < c
		|| float(int(SKY_COORDS.y * cel_size + c * 30.) % 120) / 60. < c * 2.) {
		COLOR = vec3(1.);
	} else {
		COLOR = mix(mix(top, bottom, fac), vec3(cel_unique_a, cel_unique_b, 1.0), c);
	}
}
