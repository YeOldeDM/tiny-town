
extends TextureButton

var own = null

var building_name = "House"
var occupant = null
var slot_number

var door_pos

func _ready():
	if get_parent():
		own = get_parent()
	
	door_pos = get_pos()
	door_pos.x += 72
	door_pos.y = 232
	

func set_info_slot_number():
	var label = get_node('Info/slot_number')
	var txt = "slot "+str(slot_number)
	label.set_text(txt)


func _on_TextureButton_toggled( pressed ):
	if own.has_method("_on_house_selected"):
		own._on_house_selected(pressed, self)
	else:
		print("House has a bad owner!")
	if pressed:
		set_info_show(true)
		own.house_selected = true
		get_node('/root/Game').set_camera_tracking_target(self)
	else:
		own.house_selected = false


func _on_TextureButton_mouse_enter():
	raise()
	if not own.house_selected:
		set_info_show(true)


func set_info_show(show):
	if show == true:
		get_node('Info').show()
	elif show == false:
		get_node('Info').hide()

func _on_TextureButton_mouse_exit():
	if not is_pressed():
		set_info_show(false)
