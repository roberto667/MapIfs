extends Button

func _process(delta):
	if Global.localchegada != "offscreen":
		self.text = Global.localchegada # Replace with function body.
