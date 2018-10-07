extends Node2D
export (int) var dist_min
export (PackedScene) var fireball

onready var jugador = get_node("/root/Node2D/player")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var attacks = [0, 1, 2]
	var dir = jugador.position - self.position
	if(sqrt(dir.x * dir.x + dir.y * dir.y) <= dist_min):
		
		pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass