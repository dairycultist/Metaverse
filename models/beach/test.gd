extends WorldEnvironment

func _process(delta: float) -> void:
	
	match ((Time.get_ticks_msec() / 2000) % 4):
		0: set_c((Time.get_ticks_msec() % 2000) / 2000.)
		1: set_c(1.)
		2: set_c(1. - (Time.get_ticks_msec() % 2000) / 2000.)
		3: set_c(0.)

func set_c(value):
	environment.sky.sky_material.set("shader_parameter/c", value)
