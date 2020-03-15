extends StaticBody2D

var estaMovendo = false
var speed = 100

func _ready():
	randomize()
	speed = int (rand_range(100, 200))
	pass 


func _process(delta):
	
	if estaMovendo:
		position.y += speed * delta
		if position.y > get_viewport_rect().size.y + 500:
			queue_free()

#verifica se o personagem esta na plataforma e cria uma outra
func _on_area_body_entered(body):
	if body.name == "cacadora" and not estaMovendo:
		estaMovendo = true
		get_tree().call_group("mode_ground_group" , "generate_ground", position.x) #aqui cria outra plataforma
		get_tree().call_group("hud_group", "contando_pontos") #contando os ponstos
