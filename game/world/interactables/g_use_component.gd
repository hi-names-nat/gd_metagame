extends CollisionObject3D

signal OnInteracted

@export var Outline: Node3D

func use_object() -> void:
	print("beb!!!")
	OnInteracted.emit()
	for ch in get_parent().get_children():
		if ch.has_method("object_interacted"):
			ch.object_interacted()

func player_lookat() -> void:
	Outline.visible = true

func player_stop_look() -> void:
	Outline.visible = false
