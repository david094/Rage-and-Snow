extends Area2D
onready var start_pos = get_global_position()
onready var jugador = get_node("/root/Node2D/player")

var vel = 20
var t = 1
var f = 0.5
var d = 1
var moving = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	jugador.connect("reset", self, "reset_lava")
	connect("body_entered", self, "lava_burns")
	pass

func reset_lava():
	self.set_global_position(start_pos)
	moving = false
	
func start():
	moving = true

func _process(delta):
	if (moving):
		var pos = get_global_position()
		pos.y += -(delta*vel)
		set_global_position(pos)
	
	t -= delta
	f -= delta
	if f <= 0:
		f = 0.5
		$Sprite.flip_h = not $Sprite.flip_h
	if t <= 0:
		t = 1
		d = -d
		
	$Sprite.region_rect.position.x += d
	$Sprite.region_rect.position.y += 1
	
func lava_burns(body):
	if body.has_method("reset_to_checkpoint"):
		body.reset_to_checkpoint()
	elif body.has_meta("bola"):	
		body.hide()
