extends Area2D

const vel = 15

var t = 0
var trans = 1
var f = 0.5
var d = 1

onready var h_max = get_parent().get_global_position().y

func _ready():
	connect("body_entered", self, "lava_burns")
	print (h_max)
	pass

func _process(delta):
	if get_parent().get_global_position().y > h_max:
		get_parent().set_global_position(get_parent().get_global_position()+(Vector2(0,-vel)*delta))
	
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
	if (body.has_method("reset_to_checkpoint")):
		body.reset_to_checkpoint()
	elif (body.has_meta("bola")):
		body.hide()
		body.get_parent().remove_child(body)
		get_parent().set_global_position(get_parent().get_global_position()+Vector2(0,5))
