
extends Node

var START_POS = Vector2(0,-200)

func _ready():
	START_POS.y = get_node('Camera/cam').get_limit(1)
	get_node('Camera').set_pos(START_POS)


