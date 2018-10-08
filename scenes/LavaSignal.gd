extends Area2D
export (NodePath) var door
signal start
signal reset 


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var growing_lava = get_node("/root/Node2D/growing_lava/lava_sube")

func _ready():
	
	# Called when the node is added to the scene for the first time.
	connect("body_entered", self, "start_lava")
	

func start_lava(body):
	if (body.has_method("reset_to_checkpoint")):
		growing_lava.start()
		get_node(door).deactivate()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
