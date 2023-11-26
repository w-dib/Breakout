extends Node

@onready var gameover = $GUI/Gameover
@onready var padel = $Padel
@onready var restart = $GUI/Restart

func _on_lower_wall_body_entered(_body):
	gameover.show()
	padel.hide()
	restart.show()
	hide_all_bricks()
	
func hide_all_bricks():
	var bricks = get_tree().get_nodes_in_group("Bricks")
	for brick in bricks:
		brick.hide()
	


func _on_restart_pressed():
	get_tree().reload_current_scene()
