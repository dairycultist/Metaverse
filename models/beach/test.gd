extends WorldEnvironment

func _process(delta: float) -> void:
	self.environment.sky.sky_material.set("shader_parameter/c", pow(sin(Time.get_ticks_msec() * 0.001), 2.));
	pass
