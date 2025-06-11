extends Node

@export var focused: MeshInstance3D

func _ready() -> void:
	focused.mesh.material.set("shader_parameter/selected_fac", 1.0);

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_accept"):
		focused = focused.onSelect()
	elif event.is_action_pressed("ui_left"):
		focused = focused.onLeft()
	elif event.is_action_pressed("ui_right"):
		focused = focused.onRight()
	elif event.is_action_pressed("ui_up"):
		focused = focused.onUp()
	elif event.is_action_pressed("ui_down"):
		focused = focused.onDown()
