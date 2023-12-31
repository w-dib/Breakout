extends CharacterBody2D

@onready var score = $"../GUI/Label"
@onready var gameover = $"../GUI/Gameover"


@export var initial_ball_speed = 300
@export var speed_multiplier = 1.02

var ball_speed = initial_ball_speed
var score_value = 0
var direction: Vector2 = Vector2.ZERO

func _ready():
	start_ball()
	gameover.hide()
	
func start_ball():
	randomize()
	direction = Vector2(randf_range(-1,1), randf_range(0.5,1)).normalized()
	velocity = direction * ball_speed  
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * speed_multiplier 
		if collision.get_collider().is_in_group("Bricks"):
			var brick = collision.get_collider()
			brick.queue_free()
			score_value += 1
			print(score_value)
			score.text = "SCORE: %s" % score_value
