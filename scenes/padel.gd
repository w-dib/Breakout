extends CharacterBody2D

@export var SPEED = 500
func _process(_delta):
	velocity.y = 0
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
