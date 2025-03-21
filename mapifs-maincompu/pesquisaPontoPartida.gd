extends Control

var matches = []
@onready var items = $ScrollContainer/items.get_children()

func _on_search_bar_text_changed(new_text):
	new_text = new_text.to_lower()
	if new_text == "":
		for i in items:
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
