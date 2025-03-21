extends CanvasLayer
@onready var pontopar = $PontoPartidapesquisa
@onready var pontoche = $Pontochegadapesquisa

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ponto_chegada_pressed():
	pontoche.visible = true
	Global.apear = true




func _on_ponto_partida_pressed():
	pontopar.visible = true
	Global.apear = true

