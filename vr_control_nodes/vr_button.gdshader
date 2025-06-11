shader_type spatial;
render_mode unshaded;

uniform float selected_fac : hint_range(0.0, 1.0) = 0.0;
uniform float corner_scale: hint_range(0., 1.) = 0.;

void vertex() {

}

void fragment() {

	float s = corner_scale * .5;
	vec2 centered_uv = abs(UV * 2.0 - vec2(1.0, 1.0));

    if (
		centered_uv.x > 1. - s && centered_uv.y > 1. - s &&
		pow(centered_uv.x - 1. + s, 2.) + pow(centered_uv.y - 1. + s, 2.) > pow(corner_scale * .5, 2.)
    ) {
        discard;
    }

	float cutoff = 1.0 - selected_fac / 10.0;

	ALBEDO = vec3(0.0);

	if (centered_uv.x > cutoff || centered_uv.y > cutoff) {
		ALBEDO = vec3(
			0.5 + sin(TIME - UV.x - UV.y) * 0.5,
			0.5 + sin(TIME - UV.x - UV.y + PI * 0.66) * 0.5,
			0.5 + sin(TIME - UV.x - UV.y + PI * 1.33) * 0.5
		);
	}
}