extends KinematicBody2D

var movement_enabled : bool = true

func _process(delta: float) -> void:
	
	if !movement_enabled:
		return
		
	var movement := Vector2()
	if Input.is_action_pressed("up"):
		movement.y -= 1
	if Input.is_action_pressed("down"):
		movement.y += 1
	if Input.is_action_pressed("left"):
		movement.x -= 1
	if Input.is_action_pressed("right"):
		movement.x += 1
	position += movement.normalized() * 150.00 * delta