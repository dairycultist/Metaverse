extends Node

@export var focused: bool = false

func _ready() -> void:
	# update shader based on initial focused state
	pass
	
func _input(event: InputEvent) -> void:
	
	if focused:
		if event.is_action_pressed("ui_accept"):
			onSelect()
		elif event.is_action_pressed("ui_left"):
			onLeft()
		elif event.is_action_pressed("ui_right"):
			onRight()
		elif event.is_action_pressed("ui_up"):
			onUp()
		elif event.is_action_pressed("ui_down"):
			onDown()

func giveUpFocusTo(other: Node):
	focused = false
	other.focused = true
	# update shaders

func onSelect():
	pass

func onLeft():
	pass
	
func onRight():
	pass
	
func onUp():
	pass
	
func onDown():
	pass
