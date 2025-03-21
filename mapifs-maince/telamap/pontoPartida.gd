extends Button


func _ready():
	pass
func _process(delta):
	if Global.localpartida != "offscreen":
		self.text = Global.localpartida
