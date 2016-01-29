
extends Control

var house_node = preload('res://scenes/house.scn')
var slot_node = preload('res://scenes/building_slot.scn')

var hud

var init_pos = Vector2(160,112)
var house_width = 144
var house_gap = 16
var road_y = 232

var house_selected = false

var buildings = []

func _ready():
	hud = get_node('/root/Game/HUD')

	for i in range(12):
		var pos = init_pos
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
	house.set_info_slot_number()
	add_child(house)
	buildings.append(house)
	
	pos.y = road_y
	pos.x += house_width/2
	var H = get_node('/root/Game/Heroes').spawn_hero(pos)
	house.occupant = H
	H.house = house

func _on_house_selected(pressed,house):
	var info = hud.get_node('Info')
	
	for other_house in get_children():
		if other_house extends load('res://scripts/house.gd'):
			if other_house != house:
				other_house.set_pressed(false)
				other_house.set_info_show(false)
	
	if pressed:
		info.show()
	else:
		info.hide()