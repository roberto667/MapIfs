extends Area2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
@onready var local = $local
var local1 :Vector2 
var local2:Vector2 
var finished = false


func _physics_process(_delta):
	if Global.Ondeir != null:
		visible = true
		local2 = Global.Ondeir
		global_position = local2
		local.text = Global.localchegada

