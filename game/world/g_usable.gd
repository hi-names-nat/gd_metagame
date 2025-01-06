extends CollisionObject3D

signal OnInteracted


func use_object() -> void:
	print("beb!!!")
	OnInteracted.emit()
	for ch in get_parent().get_children():
		if ch.has_method("object_interacted"):
			ch.object_interacted()
