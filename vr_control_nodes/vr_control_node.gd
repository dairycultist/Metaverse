extends MeshInstance3D

var focused: bool = false

func _ready() -> void:
	# update shader based on initial focused state
	mesh.material.set("shader_parameter/selected_fac", 1.0 if focused else 0.0);

func attemptGiveUpFocusTo(other: MeshInstance3D):
	
	if other == null:
		return self
	
	focused = false
	other.focused = true
	mesh.material.set("shader_parameter/selected_fac", 0.0);
	other.mesh.material.set("shader_parameter/selected_fac", 1.0);
	
	return other

func onSelect() -> MeshInstance3D:
	return self

func onLeft() -> MeshInstance3D:
	return self
	
func onRight() -> MeshInstance3D:
	return self
	
func onUp() -> MeshInstance3D:
	return self
	
func onDown() -> MeshInstance3D:
	return self
