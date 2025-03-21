extends Control

var progress=[]
var scenneName
@onready var progresbar = $ProgressBar
@onready var countdown = $countdown
@onready var label = $Label
var scenne_status_load = 0
var rng = RandomNumberGenerator.new()
var num = 0
var list = ['Sejam bem vindos ao Instituto Federal de Sergipe - Campus Aracaju.', 
'Vamos ajuda-lo a localizar o setor do seu interesse.']


# Called when the node enters the scene tree for the first time.
func _ready():
	num = int(randf() * 2)

	scenneName = "res://telamap/map.tscn"
	ResourceLoader.load_threaded_request(scenneName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scenne_status_load = ResourceLoader.load_threaded_get_status(scenneName, progress)
	countdown.text = str(floor(progress[0]*100))
	progresbar.value = int(countdown.text)
	if scenne_status_load == ResourceLoader.THREAD_LOAD_LOADED:
		var newscenne = ResourceLoader.load_threaded_get(scenneName)
		get_tree().change_scene_to_packed(newscenne)


func _on_timer_timeout():
	label.text = list[num] # Replace with function body.
