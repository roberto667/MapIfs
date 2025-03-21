extends Button


func _on_pressed():
	Global.localchegada = self.text
	get_parent().get_parent().get_parent().visible = false
	Global.apear = false
	Global.show1 = true

