extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("button_up", self, "start_game")
	pass

func start_game():
	get_tree().change_scene("res://scenes/Instructions.tscn")

