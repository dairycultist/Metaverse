extends Node

# stolen from https://github.com/ramatakinc/mobile-sensors-tutorial

var _pitch: float = 0.0
var _roll: float = 0.0
var _yaw: float = 0.0

var _initial_yaw: float = 0.0

const _k: float = 0.98

var enabled := false
var rotation: Vector3
	
func attempt_init_sensors():
	
	var magnet: Vector3 = Input.get_magnetometer()
	
	if (magnet == Vector3.ZERO):
		get_node("/root/World/Debug").text = "No gyro sensors detected (yet) " + str(Time.get_ticks_msec())
	else:
		get_node("/root/World/Debug").text = "Gyro sensors exist!"
		enabled = true
		_initial_yaw = atan2(-magnet.x, magnet.z)

func _physics_process(delta):
	
	if (enabled):
	
		var magnet: Vector3 = Input.get_magnetometer().rotated(-Vector3.FORWARD, rotation.z).rotated(Vector3.RIGHT, rotation.x)
		var gravity: Vector3 = Input.get_gravity()
		var roll_acc = atan2(-gravity.x, -gravity.y) 
		gravity = gravity.rotated(-Vector3.FORWARD, rotation.z)
		var pitch_acc = atan2(gravity.z, -gravity.y)
		var yaw_magnet = atan2(-magnet.x, magnet.z)
		
		var gyroscope: Vector3 = Input.get_gyroscope().rotated(-Vector3.FORWARD, _roll)
		_pitch = lerp_angle(pitch_acc, _pitch + gyroscope.x * delta, _k)
		_yaw = lerp_angle(yaw_magnet, _yaw + gyroscope.y * delta, _k)
		_roll = lerp_angle(roll_acc, _roll + gyroscope.z * delta, _k) 
		
		rotation = Vector3(_pitch, _yaw - _initial_yaw, _roll)
	
	else:
		
		attempt_init_sensors()
		
		if (Input.is_action_pressed("ui_left")):
			_yaw += delta * 1.
	
		if (Input.is_action_pressed("ui_right")):
			_yaw -= delta * 1.
			
		if (Input.is_action_pressed("ui_up")):
			_pitch += delta * 1.
	
		if (Input.is_action_pressed("ui_down")):
			_pitch -= delta * 1.
		
		rotation = Vector3(_pitch, _yaw, 0)
