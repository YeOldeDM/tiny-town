
extends Node

var male_names = [
		'aaron',
		'andrew',
		'baxter',
		'barry',
		'boris',
		'carter',
		'casey',
		'dean',
		'darryl',
		'edward',
		'eli',
		'eric',
		'fester',
		'fox',
		'gary',
		'harry',
		'ian',
		'jerry',
		'joseph',
		'john',
		'justin',
		'kasper',
		'kenneth',
		'kyle',
		'leonard',
		'marcus',
		'nelson',
		'oliver',
		'patrick',
		'peter',
		'paul',
		'randolph',
		'richard',
		'samuel',
		'stanley',
		'timothy',
		'victor',
		'wesley',
		'xavier',
		'zed'
	]


func generate_name():
	var len = male_names.size()-1
	var r1 = int(round(rand_range(0,len)))
	var r2 = int(round(rand_range(0,len)))
	var r3 = int(round(rand_range(0,len)))
	
	r1 = male_names[r1]
	r2 = male_names[r2]
	r3 = male_names[r3]
	
	r1 = r1.left(floor(r1.length()/2))
	r2 = r2.right(floor(r2.length()/2))
	r3 = r3.right(ceil(r3.length()/3))
	var name = r1.capitalize()+r2
	if randf() < 0.2:
		name += r3
	return name



