extends Node3D

@export var showOnInteract = true
@export var TextNode: Node3D
@export var hideOnTextComplete = false

var interacted = false


func _ready() -> void:
	TextNode.OnTextEnd.connect(text_end)

func object_interacted() -> void:
	if !interacted:
		print("Object visibility triggered via interaction")
		visible = true
		interacted = true

func text_end() -> void:
	visible = false
