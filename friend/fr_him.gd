extends MeshInstance3D

@export var bob = Vector3(0, -1, 0)
var b: Vector3
var has_maxed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(_switch_direction)
	$Timer.autostart = true
	b = Vector3.ZERO
	has_maxed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += (b * delta)
	if has_maxed:
		b.y = move_toward(b.y, 0, ($Timer.time_left / $Timer.wait_time) * 2)
	else:
		b.y = move_toward(0, bob.y, 1-  ($Timer.time_left / $Timer.wait_time) * 2)
		if b.y == bob.y:
			has_maxed = true
func _switch_direction() -> void:
	bob = -bob
	b.y = 0
	has_maxed = false
