extends MeshInstance3D

func _process(delta: float) -> void:
	
	rotation.y += delta / 2
	rotation.x += delta / 3
