extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("body_entered", self, "lava_burns")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func lava_burns(body):
	if (body.has_method("reset_to_checkpoint")):
		body.reset_to_checkpoint()
	else:
		body.hide()
