
extends Node

var grid = [
	[0.1,0.4,0.5],
	[0.8,0.1,0.1],
	[0.5,0.2,0.3]
	]

var current_state = 0
var next_state = 0

func choose_next_state():
	var r = randf()
	var choices = grid[current_state]
	var sum = 0
	for i in range(grid[current_state].size()):
		sum += grid[current_state][i]
		if sum > r:
			next_state = i
			break
	#printt(choices, r)
	print("Choosing "+str(next_state))
	current_state = next_state

func _ready():
	randomize()
	for i in range(10):
		choose_next_state()


