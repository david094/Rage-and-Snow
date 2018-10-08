extends KinematicBody2D

export (PackedScene) var bola_escena
export (NodePath) var bola_izq
export (NodePath) var bola_der
export (NodePath) var bola_up
export (NodePath) var bola_down
export (int) var vel_bola

#shoot direction
onready var dir_s = "r"
onready var bola_pos = get_node(bola_der)
onready var start_pos = get_global_position()
signal reset

var dir = Vector2(1,0)
#checkpoint 
var checkpoint = null

func _ready():
	set_meta("player",true)
	pass

func _input(event):
	if event.is_action_released("long_shoot"):
		vel_bola = 500
		disparo()
	if event.is_action_pressed("short_shoot"):
		vel_bola = 25
		disparo()
	if event.is_action_pressed("ui_left"):
		dir_s = "l"
	elif event.is_action_pressed("ui_right"):
		dir_s = "r"
	elif event.is_action_pressed("ui_up"):
		dir_s = "up"
	

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		$SpriteDeth.play("Left")
	if Input.is_action_pressed("ui_right"):
		$SpriteDeth.play("Right")
	else:
		$SpriteDeth.stop()

func disparo():
	
	if (dir_s == "l"):
		dir = Vector2(-1,0)
		bola_pos = get_node(bola_izq)
	elif (dir_s == "r"):
		dir = Vector2(1,0)
		bola_pos = get_node(bola_der)
	elif (dir_s == "up"):
		dir = Vector2(0,-1)
		bola_pos = get_node(bola_up)
	
	var bola = bola_escena.instance()  
	bola.set_global_position(bola_pos.get_global_position())
	bola.disparo(vel_bola,dir)
	get_parent().add_child(bola)
	
const UP = Vector2(0,-1)
const SPEED = 200
const ALTURA = -450
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
		if Input.is_action_just_pressed("ui_select"):
			motion.y = ALTURA
	motion = move_and_slide(motion,UP)
	
	pass
	
#reset player to checkpoint
func reset_to_checkpoint():
	emit_signal("reset")
	if checkpoint != null:
		set_global_position(checkpoint.get_global_position())
	else:
		set_global_position(start_pos)
	