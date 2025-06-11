extends Node3D

@onready var left = $LeftEyeContainer/LeftEye/Camera3D
@onready var right = $RightEyeContainer/RightEye/Camera3D

@export_range(40, 80) var ipd_mm : int = 62
@export_range(90, 120) var FOV : int = 110

# need to allow adjustment of FOV and IPD ingame via
# navigatable pause scene (black void like with quest)

func _ready() -> void:
	
	# divided by 2000 to get half of IPD and to convert to meters
	left.h_offset = ipd_mm / -2000.0
	right.h_offset = ipd_mm / 2000.0
	
	left.fov = FOV
	right.fov = FOV
