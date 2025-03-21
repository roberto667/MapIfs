extends Button


# Called when the node enters the scene tree for the first time.

func _ready():
	pass
func _process(delta):
	if Global.localchegada != "offscreen":
		self.text = Global.localchegada # Replace with function body.
