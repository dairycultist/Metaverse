extends "vr_control_node.gd"

@export var left: Node
@export var right: Node
@export var up: Node
@export var down: Node

func onLeft():
	giveUpFocusTo(left)
	
func onRight():
	giveUpFocusTo(right)
	
func onUp():
	giveUpFocusTo(up)
	
func onDown():
	giveUpFocusTo(down)
