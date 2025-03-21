extends Button


func _on_pressed():
	get_parent().get_parent().visible = false
	Global.apear = false
	Global.voltar = false

