extends KinematicBody2D
onready var jugador = get_node("/root/Node2D/player")
export (int) var vel
onready var direction = Vector2()

func _ready():
	direction = jugador.get_global_position()-self.get_global_position()
	direction = direction.normalized()
	pass

func _physics_process(delta):
	var mov = direction * vel
	print(direction, mov)
	move_and_slide(mov,Vector2(0,1))


func _process(delta):
	if get_slide_count()>0 :
		var obj = get_slide_collision(0).collider
		if obj.has_method("reset_to_checkpoint"):
			obj.reset_to_checkpoint()
		elif obj.has_meta("bola"):
			print("caca")
		else:
			get_parent().remove_child(self)
		
#	pass