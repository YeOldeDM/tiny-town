
extends Node2D
var own

var HP
var SP
var power
var speed
var evade
var critical

var purse

var blades
var archery
var polearms
var cudgels

func set_stats():
	HP.set_text( str(own.fighter.hp)+"/"+str(own.fighter.max_hp) )
	SP.set_text( str(own.fighter.sp)+"/"+str(own.fighter.max_sp) )
	power.set_text( str(own.fighter.power) )
	speed.set_text( str(own.fighter.speed) )
	evade.set_text( str(own.fighter.evade) )
	critical.set_text( str((own.fighter.critical*100))+"%" )
	
	purse.set_text( "$"+str(own.purse) )
	
	blades.set_text( str(own.fighter.blades_skill*100)+"%" )
	archery.set_text( str((own.fighter.archery_skill*100))+"%" )
	polearms.set_text( str((own.fighter.polearms_skill*100))+"%" )
	cudgels.set_text( str((own.fighter.cudgels_skill*100))+"%" )

func _ready():
	var vals = get_node('cont/values')
	HP = vals.get_node('hp_val')
	SP = vals.get_node('sp_val')
	power = vals.get_node('pow_val')
	speed = vals.get_node('spd_val')
	evade = vals.get_node('eva_val')
	critical = vals.get_node('crit_val')
	
	purse = vals.get_node('purse')
	
	blades = vals.get_node('blades_val')
	archery = vals.get_node('archery_val')
	polearms = vals.get_node('polearms_val')
	cudgels = vals.get_node('cudgels_val')


func _on_bubble_draw():
	set_stats()
