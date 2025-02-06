extends MeshInstance3D

@export var start_visible: bool = false
var visiblityManager: VisibleOnScreenEnabler3D
var timer: Timer

func _ready() -> void:
	if !start_visible:
		visible = false
	visiblityManager = get_child(0)
	timer = get_child(1)
	timer.timeout.connect(hide_self)

func _on_visible_on_screen_enabler_3d_screen_entered() -> void:
	if visible:
		timer.start()
		print("visible.")


func hide_self():
	visible = false
