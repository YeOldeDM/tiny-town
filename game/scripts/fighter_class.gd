
extends Node


class Fighter:
	var owner = null
	
	var jobs = []
	
	var max_hp = 10+int(round(rand_range(-2,10)))
	var hp = max_hp

	var max_sp = 10+int(round(rand_range(-2,10)))
	var sp = max_sp
	
	var power = 1
	var speed = 1
	var evade = 1
	var critical = 1.0

	var blades_skill=0.00
	var archery_skill=0.00
	var polearms_skill=0.00
	var cudgels_skill=0.00
	
	func init():
		var abils = [0,0,0]
		for i in range(10):
			var A = int(round(rand_range(0,2)))
			abils[A] += 1
		self.power += abils[0]
		self.speed += abils[1]
		self.evade += abils[2]
		
		var skillz = [0,0,0,0]
		for i in range(15):
			var S = int(round(rand_range(0,3)))
			skillz[S] += 0.01
		self.blades_skill += skillz[0]
		self.archery_skill += skillz[1]
		self.polearms_skill += skillz[2]
		self.cudgels_skill += skillz[3]

	func adjust_hp(amt):
		var new_hp = clamp( (self.hp + amt), 0, self.max_hp )
		self.hp = new_hp
		if self.hp <= 0:
			#kill me!
			pass

	func adjust_stamina(amt):
		var new_stam = clamp( (self.sp +amt), 0, self.max_sp )
		self.sp = new_stam
		