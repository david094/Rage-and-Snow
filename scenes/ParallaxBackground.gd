extends ParallaxBackground

var offset0 = 0

func _ready():
	set_process(true)

func _process(delta):
	offset0 -= 60 * delta
	set_scroll_offset(Vector2(offset0,0))


