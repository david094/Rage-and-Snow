extends RigidBody2D
export (int) var vida

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func disparo(vel_bola,dir):
	apply_impulse(Vector2(0,0),dir*vel_bola)
	
func _process(delta):
	vida -= delta
	if vida <= 0:
		get_parent().remove_child(self)
	pass
