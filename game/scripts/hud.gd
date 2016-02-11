
extends CanvasLayer

var hero_butt = preload('res://hero/hero_button.xml')

func _ready():
	# Initialization here
	pass

func add_hero_button(hero):
	var button = hero_butt.instance()
	button.owner = hero
	button.setup()
	get_node('heroes/Panel/scroll/cont').add_child(button)



func _on_heroes_toggled( pressed ):
	var panel = get_node('heroes/Panel')
	if pressed:
		panel.show()
	elif not pressed:
		panel.hide()
