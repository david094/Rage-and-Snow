extends Area2D


func _ready():
	connect("body_entered",self,"save_checkpoint")
	pass

func save_checkpoint(body):
	if body.has_method("reset_to_checkpoint"):
		body.checkpoint = self