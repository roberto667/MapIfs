extends Area2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
var local1 :Vector2 
var local2:Vector2 
var finished = false


func _physics_process(_delta):
	if Global.Ondeesta != null:
		visible = true
		local2 = Global.Ondeesta
		if Global.localpartida != "offscreen":
			global_position = local2

	if not finished:
		if Global.Ondeir != null:
			local1 = Global.Ondeir
			if Global.localchegada != "offscreen" and Global.localpartida != "offscreen":
				nav.target_position = local1
				var _direction = (nav.get_next_path_position() - global_position).normalized()
