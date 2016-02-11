
extends Control

var house_node = preload('res://scenes/house.scn')
var slot_node = preload('res://scenes/building_slot.scn')

var hud

var edge_buffer = 160
var slots_no = 32
var house_width = 144
var house_gap = 16
var road_y = 232

var house_selected = false

var buildings = []

func _ready():
	hud = get_node('/root/Game/HUD')
	var town_width = (edge_buffer*2) + (house_width*slots_no) + (house_gap*(slots_no-4))
	get_node('/root/Game/Camera/cam').set_limit(2,town_width)
	get_node('/root/Game/Camera')._ready()	#HACK re-init camera to accept new limit
	
	var road = get_node('/root/Game/World/Road')
	var road_cells = int(town_width/road.get_cell_size().x)
	for i in range(road_cells):
		road.set_cell(i,3,0)
	
	for i in range(slots_no):
		var pos = Vector2(edge_buffer, 112)
		pos.x += i*(house_width+house_gap)
		add_slot(pos,i)

func add_slot(pos,number):
	var house = slot_node.instance()
	house.set_pos(pos)
	house.slot_number = number
	add_child(house)
	#house._ready()
	
func add_house(pos,number):
	var house = house_node.instance()
	house.set_pos(pos)
	house.slot_number = number
	
	add_child(house)
	buildings.append(house)
	
	pos.y = road_y
	pos.x += house_width/2
	var H = get_node('/root/Game/Heroes').spawn_hero(pos)
	house.occupant = H
	H.house = house
	house.set_head()
	house.set_info()

func get_random_house():
	var r = int(round(rand_range(0,buildings.size()-1)))
	return buildings[r]

func _on_house_selected(pressed,house):
	var info = hud.get_node('Info')
	
	for other_house in get_children():
		if other_house extends load('res://scripts/house.gd'):
			if other_house != house:
				other_house.set_pressed(false)
				other_house.set_info_show(false)
	if pressed:
		get_node('/root/Game').set_interior(house)
	else:
		get_node('/root/Game').clear_interior()