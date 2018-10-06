extends Area2D

var vel = 20
var t = 1
var f = 0.5
var d = 1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("body_entered", self, "lava_burns")
	pass

func _process(delta):
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

	pass
	
func lava_burns(body):
	if (body.has_method("reset_to_checkpoint") || body.has_meta("bola")):
		body.hide()
