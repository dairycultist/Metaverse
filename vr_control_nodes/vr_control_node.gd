extends Node

@export var focused: bool = false

func setFocused(value: bool):
	focused = value
	# update shader

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

#VRButton
#
#left, right, up, down all tell it to focus another node (export!)
#select does nothing, need to override
#
#VRSlider
#up and down tell it to focus another node
#left right change value
