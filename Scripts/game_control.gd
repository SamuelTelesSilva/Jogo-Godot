extends Node

const file_path = "user://game.data"

var best_score = 0 setget set_bestscore

func _ready():
	load_bestscore()
	
func save_bestscore():
	var file = File.new()
	file.open (file_path, File.WRITE)
	file.store_var (best_score)
	file.close()

func load_bestscore():
	var file = File.new()
	
	if not file.file_exists(file_path):
		return
	
	file.open(file_path, File.READ)
	best_score = file.get_var()
	file.close()
	
func set_bestscore(new_score):
	best_score = new_score
	save_bestscore()
