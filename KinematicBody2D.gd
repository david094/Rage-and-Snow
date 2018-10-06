extends KinematicBody2D

export (PackedScene) var bola_escena
export (NodePath) var bola_spawn
export (int) var vel_bola
export (Vector2) var dir

onready var bola_pos = get_node(bola_spawn)

#checkpoint 
var checkpoint = null

func _ready():
	pass

func _input(event):
	if event.is_action_released("ui_select"):
		disparo()
	if event.is_action_released("ui_accept"):
		reset_to_checkpoint()

func disparo():
	dir = Vector2(1,0)
	var bola = bola_escena.instance()
	bola.set_global_position(bola_pos.get_global_position())
	
	bola.disparo(vel_bola,dir)
	get_parent().add_child(bola)
	
const UP = Vector2(0,-1)
const SPEED = 200
const ALTURA = -550
const GRAVEDAD = 20

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVEDAD
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = ALTURA
	motion = move_and_slide(motion,UP)
	pass
	
#reset player to checkpoint
func reset_to_checkpoint():
	if checkpoint != null:
		set_global_position(checkpoint.get_global_position())
	