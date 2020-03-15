extends Node2D

export (PackedScene) var ground

func _ready():
	pass 

func generate_ground (current_position_x):
	var new_ground = ground.instance()
	var new_position = Vector2(600 + current_position_x, 812)
	
	new_ground.position = new_position
	add_child(new_ground)
