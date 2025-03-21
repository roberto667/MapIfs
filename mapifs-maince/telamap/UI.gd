extends CanvasLayer

func _on_ponto_partida_gui_input(event):
	get_tree().change_scene_to_file("res://pesquisaPontoPartida.tscn")
