extends Control

var matches = []
@onready var items = $Grid.get_children()
@onready var serach : LineEdit = $searchBar
var salas = [
	"LAB's de Informática_1 a 8",
	"LABORATÓRIO de alimentos e bebidas",
	"LABORATÓRIO de Primeiros Socorros",
	"LABORATÓRIO de biologia",
	"LABORATÓRIO de fisíca",
	"LABORATÓRIO de hidraulíca",
	"LEM",
	"Sala 9",
	"Sala 10",
	"Sala 11",
	"Sala 12",
	"Sala 13(LABORATÓRIO combate incêndio)",
	"Sala 14",
	"Sala 15(LABORATÓRIO SET)",
	"Sala 16",
	"Sala 20 A",
	"Sala 20 B",
	"Sala 21",
	"Sala 22",
	"Sala 23 A",
	"Sala 23 B",
	"Sala 24",
	"Sala 25",
	"Sala 26",
	"Sala 27 A",
	"Sala 27 B",
	"Sala 27 D",
	"Sala 27 E",
	"Sala 27 F",
	"Sala 27 G",
	"Sala 27 H",
	"Sala 27 I",
	"Sala 27 J",
	"Sala 29",
	"Sala 30",
	"Sala 31",
	"Sala 32",
	"Sala 33",
	"Sala 34",
	"Sala 35",
	"Sala 35 B",
	"Sala 35 C",
	"Sala 35 D",
	"Sala 35 E",
	"Sala 36",
	"sala 37",
	"Sala 40 D",
	"Sala 41",
	"Sala 43",
	"Sala 44",
	"Sala 45",
	"Salas 101 a 107",
	"Salas 201 a 207",
	"Sala de aula(ED_ Física)",
	"Salas 1S a 8S",
	"Sala Dança"    
]

var setores = [
	"Almoxarifado",
	"ASCOM",
	"Arquivo_Protocolo",
	"Asistência estudantil(CAE)",
	"CCDD",
	"CPG_Gráfica",
	"Direção de Administração (DADM)",
	"DEN(Direção de ensino)",
	"Direção Geral(DG)",
	"CTI",
	"GET-I(Gerência do Integrado)",
	"GET-S(Gerência do Subsequente)",
	"GGRAP(Gerência da Graduação)",
	"Manutenção",
	"NAPNE",
	"PROPEX",
	"Sala de Reunião(DG)",
	"Setor médico-COSE",
	"Setor multidiciplinar"    
]

var cordenacoes = [
	"Ciên_ Humanas_Sociais_Linguísticas(CCHSL)",
	"Cien_ da Natureza(CCNAT)",
	"Turismo(CGT-COHL)",
	"Engenharia Civil(COEC)",
	"Edificações(COED)",
	"ED_ Física(COEFE)",
	"Eletrônica(COELN)",
	"Eletrotécnica(COELT)",
	"Informática(COINF)",
	"Laboratório de edificações(COLED)",
	"Matemática(COLIMA)",
	"Laboratório de Informática(COLINF)",
	"Quimica-Alimentos(COQUI-COALI)",
	"Laboratório de Química(COLIQUI)",
	"Petróleo e Gás(COPGÁS)",
	"Segurança de trabalho(COSSET)",
	"Saneamento Ambiental(CSA)"
]
var do = true

func _ready():
	pass
func _process(delta):
	if (do):
		for i in items:
			if (i.text in salas or i.text in setores or i.text in cordenacoes):
				i.visible = false
			if i.text == "CRE_Matrícula":
				i.modulate = Color.RED
	

func _on_search_bar_text_changed(new_text):
	do = false
	new_text = new_text.to_lower()
	if new_text == "":
		for i in items:
			if (i.text in salas or i.text in setores or i.text in cordenacoes):
				i.hide()
			else:
				i.show()
		return
	matches.clear()
	for i in items:
		if new_text in i.text.to_lower():
			matches.append(i)
	for i in items:
		if i in matches:
			i.show()
		else:
			i.hide()


func _on_salas_e_lab_pressed():
	do = false
	serach.placeholder_text = "Digite/selecione o local desejado"
	$Grid.columns = 4
	for child in $Grid.get_children():
		if child is Button:  # Verifica se o filho é um botão
		# Aumenta o tamanho da fonte
			child.add_theme_font_size_override('font_size', 28)  	
	for i in items:
			if (i.text in salas):
				i.show()
			else:
				i.hide()


func _on_setores_administrativos_pressed():
	do = false
	serach.placeholder_text = "Digite/selecione o local desejado"
	$Grid.columns = 3
	for child in $Grid.get_children():
		if child is Button:  # Verifica se o filho é um botão
		# Aumenta o tamanho da fonte
			child.add_theme_font_size_override('font_size', 44)  
	for i in items:
			if (i.text in setores):
				i.show()
			else:
				i.hide()


func _on_coordenações_pressed():
	do = false
	serach.placeholder_text = "Digite ou selecione o local desejado a partir dos grupos abaixo"
	$Grid.columns = 2
	for child in $Grid.get_children():
		if child is Button:  # Verifica se o filho é um botão
		# Aumenta o tamanho da fonte
			child.add_theme_font_size_override('font_size', 48)  
		for i in items:
			if (i.text in cordenacoes):
				i.show()
			else:
				i.hide()


func _on_button_pressed():
	do = false
	serach.placeholder_text = "Digite ou selecione o local desejado a partir dos grupos abaixo"
	$Grid.columns = 3
	for child in $Grid.get_children():
		if child is Button:  # Verifica se o filho é um botão
		# Aumenta o tamanho da fonte
			child.add_theme_font_size_override('font_size', 48)  
	for i in items:
			if (i.text in salas or i.text in setores or i.text in cordenacoes):
				i.hide()
			else:
				i.show()
