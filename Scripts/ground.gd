extends StaticBody2D

var estaMovendo = false
var speed = 100

func _ready():
	pass 


func _process(delta):
	
	if estaMovendo:
		position.y += speed * delta
		if position.y > get_viewport_rect().size.y + 500:
			queue_free()

func _on_area_body_entered(body):
	if body.name == "cacadora" and not estaMovendo:
		estaMovendo = true
		get_tree().call_group("mode_ground_group" , "generate_ground", position.x)
