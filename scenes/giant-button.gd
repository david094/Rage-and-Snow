extends Node2D
export (NodePath) var genericObject 

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var activado = false

func _ready():
	# Called when the node is added to the scene for the first time.
	
	$AnimatedSprite/Area2D.connect("body_entered", self, "activate")
	$AnimatedSprite/Area2D.connect("body_exited", self, "deactivate")
	pass
	
func _physics_process(delta):
	var bodies = $AnimatedSprite/Area2D.get_overlapping_bodies()
	for body in bodies:
		if (body.has_meta("goomba")):
			if (body.congelado && !activado):
				get_node(genericObject).activate()
				$AnimatedSprite.play("pressed")
				activado = true
			elif (!body.congelado && activado):
				get_node(genericObject).deactivate()
				$AnimatedSprite.play("normal")
				activado = false
			

func activate(body):
	if (body.has_meta("goomba") && body.congelado) || body.has_meta("player"):
		get_node(genericObject).activate()
		$AnimatedSprite.play("pressed")

func deactivate(body):
	if body.has_meta("goomba") || body.has_meta("player"):
		get_node(genericObject).deactivate()
		$AnimatedSprite.play("normal")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
