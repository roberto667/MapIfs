extends Control

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		$AnimationPlayer.play("fade_out") 
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://load.tscn")
