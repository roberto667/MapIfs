class_name camera extends Camera2D

var zoom_min = Vector2(1, 1)
var zoom_max = Vector2(3, 3)
var zoom_speed = Vector2(.2,.2)
var des_zoom = zoom
@export var can_pan = true
@export var can_zoom = true
@export var pan_speed = 1.0
var cont = 1
var start_distance
var start_zoom
var tamanho_map
var touch_points: Dictionary = {}
func _ready():
	tamanho_map = get_parent().size

func _process(delta):
	zoom = lerp(zoom, des_zoom, .2)

func _input(event):
	if Global.apear != true:
		if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					if des_zoom > zoom_min:
						des_zoom -= zoom_speed
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					if des_zoom < zoom_max:
						des_zoom += zoom_speed
		if event is InputEventScreenTouch:
			handle_touch(event)

		if event is InputEventScreenDrag:
			handle_drag(event)

		if event is InputEventKey:
			if event.pressed:
				if event.keycode == KEY_F1:
					if des_zoom < zoom_max:
						des_zoom += zoom_speed

				elif event.keycode == KEY_F2:
					if des_zoom > zoom_min:
						des_zoom -= zoom_speed

func handle_touch(event: InputEventScreenTouch):
	if event.pressed:
		touch_points[event.index] = event.position
	else:
		touch_points.erase(event.index)
	if touch_points.size() == 2:
		var touch_points_position = touch_points.values()
		start_distance = touch_points_position[0].distance_to(touch_points_position[1])
		start_zoom = zoom
	elif touch_points.size() <2:
		start_distance = 0

func handle_drag(event: InputEventScreenDrag):
	touch_points[event.index] = event.position
	
	if touch_points.size() == 1:
		if offset.x < ((tamanho_map.x/2)*-1) +100:
			offset.x = ((tamanho_map.x/2)*-1) + 100
		elif offset.x > ((tamanho_map.x/2)*1) - 100:
			offset.x = ((tamanho_map.x/2)*1) - 100
		if offset.y < ((tamanho_map.y/2)*-1) +100:
			offset.y= ((tamanho_map.y/2)*-1) + 100
		elif offset.y > ((tamanho_map.y/2)*1) - 100:
			offset.y = ((tamanho_map.y/2)*1) - 100
		if can_pan:
			offset -= event.relative*pan_speed/zoom.x
		else:
			offset = Vector2(0,0)
	if touch_points.size() ==2:
		var touch_points_position = touch_points.values()
		var current_dist = touch_points_position[0].distance_to(touch_points_position[1])
		var zoom_factor = start_distance/current_dist
		if can_zoom:
			des_zoom = start_zoom/zoom_factor
		limit_zoom(des_zoom)
		
			
func limit_zoom(new_zomm):
	if des_zoom.x < zoom_min.x:
		des_zoom.x = zoom_min.x
	if des_zoom.y < zoom_min.y:
		des_zoom.y = zoom_min.y
	if des_zoom.x > zoom_max.x:
		des_zoom.x = zoom_max.x
	if des_zoom.y > zoom_max.y:
		des_zoom.y = zoom_max.y




func _on_mapa_completo_pressed():
	des_zoom = Vector2(1,1)
	offset = Vector2(0,0)
