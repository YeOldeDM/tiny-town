
extends Node

var START_POS = Vector2(0,-200)
var START = false


func _ready():
	print(PI)
	START_POS.y = get_node('Camera/cam').get_limit(1)
	get_node('Camera').set_pos(START_POS)
	
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.KEY:
		if event.scancode == KEY_DOWN:
			if not START:
				START = true
				get_node('pressdown').queue_free()
				get_node('Title').queue_free()
		
	
func set_camera_tracking_target(target):
	var t_x = target.get_global_pos().x + (target.get_rect().size.width/2)
	get_node('Camera').tracking_target = t_x
	get_node('Camera').tracking_object = null
	get_node('Camera').is_tracking = true

func set_camera_tracking_object(target):
	get_node('Camera').tracking_object = target
	get_node('Camera').tracking_target = null
	get_node('Camera').is_tracking = true
