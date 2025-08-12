extends Node3D

@onready var left_cam = $LeftEyeContainer/LeftEye/Camera3D
@onready var right_cam = $RightEyeContainer/RightEye/Camera3D

@onready var left_container = $LeftEyeContainer
@onready var right_container = $RightEyeContainer

# need to allow adjustment ingame via navigatable settings menu
@export_group("Camera Settings")
@export_range(40, 80) var ipd_mm : int = 62
@export_range(90, 120) var FOV : int = 110

var yaw := 0.

func _ready() -> void:
	
	apply_camera_settings()

func _process(delta: float) -> void:
	
	left_cam.rotation = Gyro.rotation
	right_cam.rotation = Gyro.rotation
	left_cam.position = position
	right_cam.position = position

func apply_camera_settings():
	
	# divided by 2000 to get half of IPD and to convert to meters
	left_cam.h_offset = ipd_mm / -2000.0
	right_cam.h_offset = ipd_mm / 2000.0
	
	left_cam.fov = FOV
	right_cam.fov = FOV
	
	left_container.anchor_left = 0
	right_container.anchor_right = 1.0
