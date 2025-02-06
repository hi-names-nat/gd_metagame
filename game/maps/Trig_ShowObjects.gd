extends Area3D

@export var nodesToAppear: Array[Node]

var triggered: bool = false

func _on_body_entered(body: Node3D) -> void:
	if !triggered and body.is_class("CharacterBody3D"):
		for node: Node in nodesToAppear:
			node.visible = true
			triggered = true
			print("objects now visible.")
