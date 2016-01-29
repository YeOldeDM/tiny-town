
extends Node

var START_POS = Vector2(0,-200)
var START = false


func _ready():
	START_POS.y = get_node('Camera/cam').get_limit(1)
	get_node('Camera').set_pos(START_POS)
	
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.KEY:
		if event.scancode == KEY_DOWN:
			if not START:
				START = true
				get_node('pressdown').queue_free()
		
	


