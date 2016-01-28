
extends Control


var heroes =[]
var hero_node = preload('res://scenes/hero.xml')

func spawn_hero(pos):
	var H = hero_node.instance()
	H.set_pos(pos)
	add_child(H)
	heroes.append(H)
	return H
	
func _ready():
	# Initialization here
	pass


