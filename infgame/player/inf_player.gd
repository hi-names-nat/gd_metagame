extends CharacterBody2D

const SPEED = 300.0
const DODGE_LEN = 100.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("inf_left", "inf_right"), Input.get_axis("inf_up", "inf_down"))
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		if Input.is_action_just_pressed("inf_dodge"):
			position += direction.normalized() * DODGE_LEN
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if Input.is_action_just_pressed("inf_attack"):
		$atk.visible = true
		$Timer.timeout.connect(_sword_finish)
		$Timer.start()
	move_and_slide()

func _sword_finish() -> void:
	$atk.visible = false
