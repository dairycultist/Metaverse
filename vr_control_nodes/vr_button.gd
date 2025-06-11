extends "vr_control_node.gd"

@export var left: Node
@export var right: Node
@export var up: Node
@export var down: Node

func onLeft():
	return attemptGiveUpFocusTo(left)

func onRight():
	return attemptGiveUpFocusTo(right)

func onUp():
	return attemptGiveUpFocusTo(up)

func onDown():
	return attemptGiveUpFocusTo(down)
