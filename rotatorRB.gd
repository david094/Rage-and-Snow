extends RigidBody2D
onready var trns = get_global_transform()
onready var jugador = get_node("/root/Node2D/player")
#reset
var res = false
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_meta("rotator",true)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	jugador.connect("reset",self,"reset_rot")
	set_can_sleep(false)
	pass

func reset_rot():
	res = true

func _integrate_forces(state):
	if res:
		res = false
		state.transform = trns
		state.linear_velocity = Vector2(0,0)
		state.angular_velocity = 0

#func reset_rot():
	#set_global_rotation_degrees(rota)
	#set_global_position(start_pos)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
