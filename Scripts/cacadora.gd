extends KinematicBody2D

const gravidade = 2000
const speed = 500
const forca_pulo = -900

var linear_velocidade = Vector2(0, 0)

var pulo = false
var movimento = false
var estaVivo = true

func _ready():
	set_process_input(true)
	pass 

func _physics_process(delta):
	linear_velocidade.y += gravidade * delta
	
	if estaVivo:
		
		if is_on_floor():
			
			linear_velocidade.x = 0
			
			if pulo:
				linear_velocidade.y = forca_pulo
		elif movimento:
			linear_velocidade.x = speed
		else:
			linear_velocidade.x = 0
		
		pulo = false
		#se a posição do meu personagem for maior que o eicho x então ele morre
		if position.y > get_viewport_rect().size.y:
			
			pass
		
	linear_velocidade = move_and_slide(linear_velocidade, Vector2(0, -1))
