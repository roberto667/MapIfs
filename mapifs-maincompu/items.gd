extends VBoxContainer

func _process(delta):
	for i in get_children():
		i.text = Global.local[i.get_index()]
