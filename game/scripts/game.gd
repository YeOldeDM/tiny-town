
extends Node

var START_POS = Vector2(0,-200)
var START = false

var heroes
var buildings

var house_inner = preload('res://scenes/house_inner.scn')
var interior_port

func _ready():
	heroes = get_node('Heroes')
	buildings = get_node('World/Buildings')
	interior_port = get_node('HUD/Interior')
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
		
func select_hero(hero):
	heroes.hero_selected(hero)
	set_camera_tracking_object(hero)

func set_camera_tracking_target(target):
	var t_x = target.get_global_pos().x + (target.get_rect().size.width/2)
	get_node('Camera').tracking_target = t_x
	get_node('Camera').tracking_object = null
	get_node('Camera').is_tracking = true

func set_camera_tracking_object(target):
	get_node('Camera').tracking_object = target
	get_node('Camera').tracking_target = null
	get_node('Camera').is_tracking = true

func find_random_house():
	return buildings.get_random_house()


func set_interior(house):
	if interior_port.get_child_count() > 0:
		clear_interior()
	var interior = house_inner.instance()
	interior_port.add_child(interior)

func clear_interior():
	for child in interior_port.get_children():
		child.queue_free()