
extends Control


var heroes =[]
var hero_node = preload('res://scenes/hero.xml')

func spawn_hero(pos):
	var H = hero_node.instance()
	H.set_pos(pos)
	H.x_limit = get_node('/root/Game/Camera').town_x_limit
	add_child(H)
	heroes.append(H)
	return H
	
func _ready():
	# Initialization here
	pass


