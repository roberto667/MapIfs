class_name map extends Control

@export var max_width:float = 500.0
@export var locais : Node2D
@onready var bolinhalocal = $bolinhas/local
@onready var bolinhasprite = $bolinhas/Sprite2D
@onready var cam = $Camera2D
@onready var esta = $Esta
@onready var estanav = $Esta/NavigationAgent2D
@onready var pontochegada = $CanvasLayer/pontoChegada
@onready var pontopartida = $CanvasLayer/pontoPartida
@onready var voltar = $"CanvasLayer/Mapacompleto"
@onready var show = $CanvasLayer/Referencia
@onready var mapacompleto = $Camera2D/Mapacompleto
@onready var fundomapacompleto = $Camera2D/FundoMapa
var ver = false
var loca1
var loca2

func _ready():
	locais = get_node("Camera2D/escola/locais")
	for child in locais.get_children():
		if child is Area2D:
			Global.local.append(child.name)
	locais.visible = false
	bolinhalocal.finished.connect(_fit_width, CONNECT_DEFERRED)
func _process(delta):
	loca1 = get_node("Camera2D/escola/locais/"+Global.localchegada).global_position
	Global.ondeir(loca1)
	loca2 = get_node("Camera2D/escola/locais/"+Global.localpartida).global_position
	Global.ondeesta(loca2)	
	if Global.show1 and Global.show2 and !Global.voltar:
		show.visible = true
		locais.visible = true
	else:
		show.visible = false
	bolinhalocal.size = Vector2.ZERO
	bolinhalocal.fit_content = true



func _on_mapacompleto_pressed():
	if !ver:
		estanav.debug_enabled = false
		esta.visible = false
		pontochegada.visible = false
		pontopartida.visible = false
		Global.show2 = false
		voltar.text = "Voltar"
		mapacompleto.visible = true
		fundomapacompleto.visible = true
		ver = true
		bolinhasprite.visible = false
		bolinhalocal.visible = false
	else:
		estanav.debug_enabled = true
		esta.visible = true
		pontochegada.visible = true
		pontopartida.visible = true
		Global.show2 = true
		voltar.text = "Mapa completo"
		mapacompleto.visible = false
		fundomapacompleto.visible = false
		ver = false
		bolinhasprite.visible = true
		bolinhalocal.visible = true


func _fit_width() -> void:
	# block the signals so "finished" does not trigger this function again
	set_block_signals(true)
	var original_autowrap = bolinhalocal.autowrap_mode
	# save the position
	var tmp = global_position
	# move it out of the way to avoid flashing
	global_position.x = -100000
	# disable autowrap
	bolinhalocal.autowrap_mode = TextServer.AUTOWRAP_OFF
	# make it 0, 0
	size = Vector2.ZERO
	# wait one frame
	await get_tree().process_frame
	# now we have the size with no autowrap
	# if the width is bigger than max width clamp it
	var w = clampf(size.x, 0, max_width)
	var h = size.y
	# restore the autowrap mode
	bolinhalocal.autowrap_mode = original_autowrap
	# set the maximum size we got
	size.x = w
	# wait one frame for the text to resize
	await get_tree().process_frame
	# if the height is bigger than before we have multiple lines
	# and we may need to make the width smaller
	if size.y > h:
		# save the height
		h = size.y
		# keep lowering the width until the height changes
		while true:
			# lower the width a bit
			size.x -= 10
			# wait one frame
			await get_tree().process_frame
			# check if the height changed
			if not is_equal_approx(size.y, h):
				# if it changed we made the textbox too small
				# restore the width and break the while loop
				size.x += 10
				break
	# wait one frame
	await get_tree().process_frame
	# restore the height
	size.y = h
	# restore the original position
	global_position = tmp
	# unblock the signals
	set_block_signals(false)

