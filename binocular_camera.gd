extends Node3D

@onready var left = $LeftEyeContainer/LeftEye/Camera3D
@onready var right = $RightEyeContainer/RightEye/Camera3D

# need to allow adjustment of FOV and IPD ingame via navigatable pause scene
# (black void like with quest)

func _ready() -> void:
	left.h_offset = 0.031
	right.h_offset = -0.031
	
	left.fov = 110
	right.fov = 110
