
extends TextureButton

var own = null

var label
var slot_number = 0

func _ready():
	label = get_node('Label')
	if get_parent():
		own = get_parent()




func _on_building_slot_pressed():
	own.add_house(get_pos(),slot_number)
	queue_free()


func _on_building_slot_mouse_enter():
	label.set('custom_colors/font_color',Color(0,1.0,0))
	label.get_node('animator').play('bounce')


func _on_building_slot_mouse_exit():
	label.set('custom_colors/font_color',Color(1.0,0,0))
	label.get_node('animator').stop()
	label.get_node('animator').seek(0,true)
