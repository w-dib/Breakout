extends CharacterBody2D

@export var initial_ball_speed = 450
@export var speed_multiplier = 1.02

var ball_speed = initial_ball_speed

var direction: Vector2 = Vector2.ZERO

func _ready():
	start_ball()

func start_ball():
	randomize()
	direction = Vector2(randf_range(-1,1), randf_range(0.5,1)).normalized()
	velocity = direction * ball_speed  
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * speed_multiplier 
