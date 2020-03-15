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
			mortePersonagem()
			pass
		
	move_and_slide(linear_velocidade, Vector2(0, -1))
	play_animacao()
func _input(event):
	
	if event is InputEventScreenTouch:
		if event.pressed:
			movimento = true and is_on_floor()
			pulo = true
		else:
			movimento = false
			
func play_animacao():
	
	if estaVivo:
		if is_on_floor():
			$animacao.play("idle")
		else:
			if linear_velocidade.y > 0:
				$animacao.play("idle")
			elif linear_velocidade.y < 0:
				$animacao.play("jump")
	
	else:
		$animacao.play("dead")
	
	
func mortePersonagem():

	if estaVivo:
		estaVivo = false
		linear_velocidade = Vector2(0, forca_pulo)
	
	
	
	
	
	
