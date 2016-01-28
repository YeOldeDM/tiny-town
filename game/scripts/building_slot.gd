
extends TextureButton

var own = null

func _ready():
	if get_parent():
		own = get_parent()




func _on_building_slot_pressed():
	own.add_house(get_pos())
	queue_free()
