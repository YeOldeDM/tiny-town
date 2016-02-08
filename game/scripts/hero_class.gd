
extends Node

class Hero:
	var owner = null
	var name = "NaN"
	
	var jobs = []
	
	var max_hp = 10
	var hp = 10

	var power = [1,2]
	var atk_spd = 1.0
	
	var critical = 0.0
	
	var max_stamina = 10
	var stamina = 10
	
	var gold
	var xp
	var inventory = []
	
	func get_stamina():
		return [self.stamina,self.max_stamina]
	
	func get_stamina_per():
		return (self.stamina/self.max_stamina)
	
	func get_hp():
		return [self.hp,self.max_hp]
	
	func get_hp_per():
		return (self.hp/self.max_hp)
		
	func _get_damage_range():
		var dmg_diff = self.power[1]-self.power[0]
		var min_dmg = self.power[0]+(int(dmg_diff*self.critical))
		var max_dmg = self.power[1]
		return [min_dmg, max_dmg]
	
	func fight():
		var dmg_range = self._get_damage_range()
		var dmg = int(round(rand_range(dmg_range[0],dmg_range[1])))
		return dmg
	
	func adjust_hp(amt):
		var new_hp = clamp( (self.hp + amt), 0, self.max_hp )
		self.hp = new_hp
		if self.hp <= 0:
			#kill me!
			pass

	func adjust_stamina(amt):
		var new_stam = clamp( (self.stamina +amt), 0, self.max_stamina )
		self.stamina = new_stam
		