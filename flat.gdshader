shader_type spatial;
render_mode unshaded;

uniform sampler2D albedo: source_color;
uniform vec3 color : source_color = vec3(1.);

void fragment() {
	
	vec4 sample = texture(albedo, UV);
	
	if (sample.a < 0.9) {
		discard;
	}
	
	ALBEDO = sample.rgb * color * smoothstep(.01, .03, FRAGCOORD.z);
}