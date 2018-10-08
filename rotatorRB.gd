extends RigidBody2D
onready var rota = get_global_rotation_degrees() 
onready var start_pos = get_global_position()
onready var jugador = get_node("/root/Node2D/player")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_meta("rotator",true)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#jugador.connect("reset",self,"reset_rot")
	pass

#func reset_rot():
	#set_global_rotation_degrees(rota)
	#set_global_position(start_pos)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
