extends CanvasLayer

var pontos = 0

func contando_pontos():
	pontos +=2
	$score.text = str (pontos)
