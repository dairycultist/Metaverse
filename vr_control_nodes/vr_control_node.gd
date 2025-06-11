extends Node

@export var focused: bool = false

#VRSlider
#up and down tell it to focus another node
#left right change value

func _ready() -> void:
	# update shader based on initial focused state
	pass

func giveUpFocusTo(other: Node):
	focused = false
	other.focused = true
	# update shaders

func onLeft():
	pass
	
func onRight():
	pass
	
func onUp():
	pass
	
func onDown():
	pass
	
func onSelect():
	pass
