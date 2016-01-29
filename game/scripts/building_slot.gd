
extends TextureButton

var own = null

var slot_number = 0

func _ready():
	if get_parent():
		own = get_parent()




func _on_building_slot_pressed():
	own.add_house(get_pos(),slot_number)
	queue_free()
