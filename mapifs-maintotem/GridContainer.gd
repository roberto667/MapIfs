extends GridContainer

var botoes = [
	"Salas de Aula e Laboratórios",
	"Setores Administrativos",
	"Coordenações"
]
var do = true

func _process(delta):
	for i in get_children():
		if(i.text not in botoes):
			i.text = Global.local[i.get_index()-3]
			
	
