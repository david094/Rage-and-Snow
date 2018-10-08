extends KinematicBody2D
export (int) var dist_min
export (int) var vel
export (int) var gravedad
export (PackedScene) var fireball
export (int) var intervalo_bola 
export (int) var vida

onready var jugador = get_node("/root/Node2D/player")
onready var puerta = get_node("/root/Node2D/puerta_warney")
onready var start_pos = get_global_position()
onready var timer_bola = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	timer_bola = intervalo_bola
	$Area2D.connect("body_entered", self, "warney_danger")
	pass

func _physics_process(delta):
	var mov = Vector2()
	mov.y = gravedad
	var dir = jugador.position - self.get_global_position()
	if(sqrt(dir.x*dir.x + dir.y*dir.y) <= dist_min):
		if(dir.x < 0):
			mov.x = -1
		else:
			mov.x = 1
		mov.x = mov.x * vel
		
	move_and_slide(mov, Vector2(0,1))

func _process(delta):
	timer_bola -= delta
	if !($AnimatedSprite.is_playing()):
		$AnimatedSprite.play("default")
	if(timer_bola<=0):
		timer_bola = intervalo_bola
		fire_shot()
	if vida <= 0:
		puerta.activate()
		get_parent().remove_child(self)
		

func fire_shot():
	$AnimatedSprite.play("shoot")
	var fire = fireball.instance()
	fire.set_global_position($Timmy.get_global_position())
	get_node("/root/Node2D").add_child(fire)
	
func warney_danger(body):
	if body.has_meta("bola"):
		vida -= 1
		body.get_parent().remove_child(body)
	