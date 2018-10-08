extends Node2D
onready var start_pos = get_global_position()
onready var jugador = get_node("/root/Node2D/player")

export (bool) var reset

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var height = 50

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if reset:
		jugador.connect("reset", self, "reset_puerta")
	pass

func activate():
	set_global_position(get_global_position() + Vector2(0,-height))	

func deactivate():
	set_global_position(get_global_position() + Vector2(0,height))	

func reset_puerta():
	self.set_global_position(start_pos)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
