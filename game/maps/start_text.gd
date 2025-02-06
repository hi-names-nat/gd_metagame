extends Area3D

var entered = false
var time_started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $GFloatingText.line_finished and !time_started:
		time_started = true
		$Timer.start()

func _on_body_entered(body: Node3D) -> void:
	if entered: 
		return
	entered = true
	for ch in get_children():
		if ch.has_method("object_interacted"):
			print("beb")
			ch.object_interacted()
			$Timer.timeout.connect(ch.object_interacted)
			$Timer.timeout.connect(_time_over)

func _time_over() ->void:
	time_started = false
