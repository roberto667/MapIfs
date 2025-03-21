extends Button


func _on_pressed():
	Global.localpartida = self.text
	get_parent().get_parent().get_parent().visible = false
	Global.apear = false
	Global.show2 = true

