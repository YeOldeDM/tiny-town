
extends StaticBody2D

var hero_name = ""

var hero_class

var WALK_SPEED = 60.0
var x_limit = 0

var doll
var hero
var house

var left_cast
var right_cast

var relations = []

var current_state = 'idle'
var target_pos = set_random_target_pos()

var decision_timer = 0
var decision_timeout

var step_timer = 0
var step_timeout = 0.1

func _ready():
	hero_name = get_node('/root/nameGen').generate_name()
	get_node('nametag').set_text(hero_name)
	hero_class = get_node('/root/hero').Hero
	doll = get_node('Doll')
	left_cast = get_node('cast_left')
	right_cast = get_node('cast_right')
	set_random_decision_timeout()
	set_random_walk_speed()
	set_process(true)
	hero = hero_class.new()

func _process(delta):
	if left_cast.is_colliding():
		var col = left_cast.get_collider()
		if col extends get_script():
			current_state = 'idle'
	if right_cast.is_colliding():
		var col = right_cast.get_collider()
		if col extends get_script():
			current_state = 'idle'

	if current_state == 'move':
		var pos = get_pos().x

		if (target_pos-1) < pos and pos < (target_pos+1):
			pos = target_pos
			current_state = 'idle'
			decision_timer = 0
		else:
			_move(delta)
			
			if step_timer >= step_timeout:
				step()
				step_timer = 0
			else:
				step_timer += delta

	if current_state == 'idle':
		stand_still()
		if decision_timer >= decision_timeout:
			set_random_target_pos()
			set_random_decision_timeout()
			set_random_walk_speed()
			decision_timer = 0
			current_state = 'move'
		else:
			decision_timer += delta

	

func _move(delta):
	var pos = get_pos()
	if target_pos < pos.x:
		pos.x -= delta*WALK_SPEED
		doll.set_scale(Vector2(-1,1))
		left_cast.set_enabled(true)
		right_cast.set_enabled(false)
	elif target_pos > pos.x:
		pos.x += delta*WALK_SPEED
		doll.set_scale(Vector2(1,1))
		left_cast.set_enabled(false)
		right_cast.set_enabled(true)
	set_pos(pos)
		

func set_random_target_pos():
	target_pos = int(round(rand_range(0,x_limit)))

func set_random_decision_timeout():
	decision_timeout = rand_range(1,4)

func set_random_walk_speed():
	WALK_SPEED = rand_range(30,70)
	step_timeout = 1.0 - (WALK_SPEED * 0.01)
	
func stand_still():
	doll.set_pos(Vector2(0,0))
	doll.set_rot(0)

func step():
	var height = doll.get_pos()
	if height.y < 0:
		height.y = 0
	else:
		height.y = -rand_range(1,3)
	var r_dir = randf()
	var r = 0
	if r_dir <= 0.5:
		r = rand_range(deg2rad(350),deg2rad(355))
	else:
		r = rand_range(deg2rad(5),deg2rad(10))
	doll.set_rot(r)
	doll.set_pos(height)
	

func _on_selector_pressed():
	get_node('/root/Game').set_camera_tracking_object(self)

