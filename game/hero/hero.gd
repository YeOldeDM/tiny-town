
extends Node2D

var WALK_SPEED = 60.0

var doll
var house

var current_state = 'move'
var target_pos = int(round(rand_range(64,1024)))

var decision_timer = 0
var decision_timeout

func _ready():
	doll = get_node('Doll')
	set_random_decision_timeout()
	set_random_walk_speed()
	set_process(true)
	
func _process(delta):
	if current_state == 'move':
		var pos = get_pos().x

		if (target_pos-1) < pos and pos < (target_pos+1):
			pos = target_pos
			current_state = 'idle'
			decision_timer = 0
		else:
			_move(delta)
	if current_state == 'idle':
		if decision_timer >= decision_timeout:
			set_random_target_pos()
			set_random_decision_timeout()
			decision_timer = 0
			current_state = 'move'
		else:
			decision_timer += delta


func _move(delta):
	var pos = get_pos()
	if target_pos < pos.x:
		pos.x -= delta*WALK_SPEED
		set_scale(Vector2(-1,1))
	elif target_pos > pos.x:
		pos.x += delta*WALK_SPEED
		set_scale(Vector2(1,1))
	set_pos(pos)
		

func set_random_target_pos():
	target_pos = int(round(rand_range(0,2304)))

func set_random_decision_timeout():
	decision_timeout = rand_range(1,4)

func set_random_walk_speed():
	WALK_SPEED = rand_range(50,70)