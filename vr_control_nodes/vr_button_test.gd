extends "vr_button.gd"

func onSelect() -> MeshInstance3D:
	position.y += 1.0
	print("hello")
	return self
