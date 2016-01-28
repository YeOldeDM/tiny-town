
extends ReferenceFrame

var town_x_limit
var cam_x_limit

var town_y_limit
var cam_y_limit

var speed = 5.0

func _ready():
	town_x_limit = get_node('cam').get_limit(2)
	cam_x_limit = town_x_limit - get_rect().size.width
	
	town_y_limit = get_node('cam').get_limit(3)
	cam_y_limit = town_y_limit - get_rect().size.height
	set_process(true)
	
func _process(delta):
	var LEFT = Input.is_action_pressed('pan_left')
	var RIGHT = Input.is_action_pressed('pan_right')
	
	var UP = Input.is_action_pressed('ui_up')
	var DOWN = Input.is_action_pressed('ui_down')
	
	var DRAG = Input.is_action_pressed('drag_pan')
	
	var pos = get_pos()
	
	if DRAG:
		var screen_x = get_viewport().get_rect().size.width
		var mouse_x = get_viewport().get_mouse_pos().x
		var drag_factor = ( ( (screen_x/2) + mouse_x ) - screen_x ) / (screen_x/2)
		pos.x += speed*drag_factor
	
	else:
		if LEFT:
			pos.x -= speed
		
		if RIGHT:
			pos.x += speed
		
		if UP:
			pos.y -= speed
		if DOWN:
			pos.y += speed
	
	pos.x = clamp(pos.x, 0.0, cam_x_limit)
	pos.y = clamp(pos.y, get_node('cam').get_limit(1), cam_y_limit)

	set_pos(pos)



