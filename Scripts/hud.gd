extends CanvasLayer

var pontos = 0

func _ready():
	$music.play()

func contando_pontos():
	pontos += 2
	$score.text = str (pontos)

func game_over():
	$music.stop()
	
	$score.hide()
	$game_over/AnimationPlayer.play("game_over")
	$game_over/last.text = str (pontos)
	
	if pontos > GameControl.best_score:
		GameControl.best_score = pontos
	
	$game_over/best.text = str (GameControl.best_score)
	

func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().change_scene("res://assets/scene/menu.tscn")
