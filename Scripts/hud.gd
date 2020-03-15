extends CanvasLayer

var pontos = 0

func contando_pontos():
	pontos +=2
	$score.text = str (pontos)

func game_over():
	$score.hide()
	$game_over/AnimationPlayer.play("game_over")
	$game_over/last.text = str (pontos)
	$game_over/best.text = str (pontos)


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().change_scene("res://assets/scene/menu.tscn")
