
extends ReferenceFrame

var town_x_limit
var cam_x_limit

var town_y_limit
var cam_y_limit

var sky_max = -200
var cam_min = Vector2(0,0)
var cam_max = Vector2(0,0)

var speed = 5.0

var tracking_target = null
var tracking_object = null
var is_tracking = false

func _ready():
	town_x_limit = get_node('cam').get_limit(2)
#	cam_x_limit = town_x_limit - (get_rect().size.width/2)
	
	cam_min.x = get_rect().size.width/2
	cam_max.x = town_x_limit - (get_rect().size.width/2)
	
	town_y_limit = get_node('cam').get_limit(3)
#	cam_y_limit = town_y_limit - (get_rect().size.height/2)
	
	cam_min.y = sky_max + (get_rect().size.height/2)
	cam_max.y = town_y_limit - (get_rect().size.height/2)

	set_process(true)
	
func _process(delta):
	var LEFT = Input.is_action_pressed('pan_left')
	var RIGHT = Input.is_action_pressed('pan_right')
	
	var UP = Input.is_action_pressed('ui_up')
	var DOWN = Input.is_action_pressed('ui_down')
	
	var DRAG = Input.is_action_pressed('drag_pan')
	
	var pos = get_pos()
	
	if is_tracking:
		if tracking_object:
			tracking_target = null
			track_to_object(delta)
			
		elif tracking_target:
			track_to_target(delta)
		else:
			is_tracking = false

		if DRAG or UP or DOWN or LEFT or RIGHT:
			if tracking_object:
				if tracking_object.has_method('hide_bubble'):
					tracking_object.hide_bubble()
				tracking_object = null
	else:
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
		
		pos.x = clamp(pos.x, cam_min.x, cam_max.x)
		pos.y = clamp(pos.y, cam_min.y, cam_max.y)
	
		set_pos(pos)

func track_to_object(delta):
	var pos = get_pos()
	var c_pos = get_node('center').get_global_pos()
	var t_x = tracking_object.get_global_pos().x
	
	if t_x - 10 < c_pos.x and t_x + 10 > c_pos.x:
		pos.x = t_x
	else:
		if t_x < c_pos.x:
			pos.x -= speed
		elif t_x > c_pos.x:
			pos.x += speed
	set_pos(pos)

func track_to_target(delta):
	var pos = get_pos()
	var c_pos = get_node('center').get_global_pos()

	if tracking_target - 10 < c_pos.x and tracking_target + 10 > c_pos.x:
		pos.x = tracking_target
		is_tracking = false
	else:
		if tracking_target < c_pos.x:
			pos.x -= speed#(speed*delta)*30
		elif tracking_target > c_pos.x:
			pos.x += speed#(speed*delta)*30
	set_pos(pos)
	

