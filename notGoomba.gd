extends KinematicBody2D

#export (NodePath) var jugador
export (int) var vida 
export (float) var defrost
export (int) var dist_min
export (int) var vel

const gravedad = 100

var congelado = false
var defrost_t = 0.0

onready var jugador = get_node("/root/Node2D/player")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if congelado:
		defrost_t -= delta   
		$ColorRect.color.a = (0.9*defrost_t) / defrost   
		if defrost_t <= 0.0:
			congelado = false
			

func _physics_process(delta):
	var mov = Vector2()
	mov.y = gravedad
	if not congelado:
		#direcion a jugador
		var dir = jugador.position - self.position
		#print(dir)
		#calcular distancia
		if(sqrt(dir.x*dir.x + dir.y*dir.y) <= dist_min):
			#mover  en direccion al jugador
			if(dir.x < 0):
				mov.x = -1
			else:
				mov.x = 1
			mov.x = mov.x*vel
		
	move_and_slide(mov,Vector2(0,1))
	
	if($Area2D.get_overlapping_bodies().size() > vida):
		congelado = true
		defrost_t = defrost
		#defrost --> .9
		#def_t --> x
		#0.9*def_t / defrost
		$ColorRect.color.a = 0.9