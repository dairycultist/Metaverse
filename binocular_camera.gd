extends Node3D

@onready var left_cam = $LeftEyeContainer/LeftEye/Camera3D
@onready var right_cam = $RightEyeContainer/RightEye/Camera3D

@onready var left_container = $LeftEyeContainer
@onready var right_container = $RightEyeContainer

@export_range(40, 80) var ipd_mm : int = 62
@export_range(90, 120) var FOV : int = 110
@export_range(0.0, 0.2, 0.01) var re_aspect : float = 0.0

# need to allow adjustment of FOV and IPD ingame via
# navigatable pause scene (black void like with quest)

func _ready() -> void:
	
	apply_camera_settings()

func _process(delta: float) -> void:
	
	# for testing
	re_aspect = (sin(Time.get_ticks_msec() * 0.0005) + 1.0) / 10
	
	apply_camera_settings()

func apply_camera_settings():
	
	# divided by 2000 to get half of IPD and to convert to meters
	left_cam.h_offset = ipd_mm / -2000.0
	right_cam.h_offset = ipd_mm / 2000.0
	
	left_cam.fov = FOV
	right_cam.fov = FOV
	
	left_container.anchor_left = re_aspect
	right_container.anchor_right = 1.0 - re_aspect
