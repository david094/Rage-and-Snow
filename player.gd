extends KinematicBody2D

export (PackedScene) var bola_escena
export (NodePath) var bola_izq
export (NodePath) var bola_der
export (int) var vel_bola

#shoot direction
onready var dir_s = "r"
onready var bola_pos = get_node(bola_der)

var dir = Vector2(1,0)
#checkpoint 
var checkpoint = null

func _ready():
	pass

func _input(event):
	if event.is_action_released("ui_select"):
		disparo()
	if event.is_action_pressed("ui_left"):
		dir_s = "l"
		$SpriteDeth.play("Left")
	elif event.is_action_pressed("ui_right"):
		dir_s = "r"
		$SpriteDeth.play("Right")
	else: 
		$SpriteDeth.stop()

func disparo():
	
	if(dir_s == "l"):
		dir = Vector2(-1,0)
		bola_pos = get_node(bola_izq)
	else:
		dir = Vector2(1,0)
		bola_pos = get_node(bola_der)
	
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
	#empujar objeto debajo
	if $RayCast2D.is_colliding():
		var col = $RayCast2D.get_collider()
		if col.has_meta("rotator"):
			if col.global_position.x-self.global_position.x < 0:
				col.apply_impulse($RayCast2D.get_collision_point(),Vector2(0,0.1))
			else:
				col.apply_impulse($RayCast2D.get_collision_point(),Vector2(0,-0.1))

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
	