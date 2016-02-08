
extends Node2D

const BODY_GIRLY = 0
const BODY_MANLY = 1

const ARMOR_LEATHER = 0
const ARMOR_ADVENTURE = 1
const ARMOR_ROBE = 2
const ARMOR_CHAIN = 3
const ARMOR_NONE = 4

const WEAPON_SWORD = 0
const WEAPON_BOW = 1
const WEAPON_STAFF = 2
const WEAPON_SPEAR = 3
const WEAPON_DAGGER = 4
const WEAPON_AXE = 5
const WEAPON_BOOK = 6
const WEAPON_CROSSBOW = 7
const WEAPON_NONE = 8




var armors = [
		[0,1],	#Leather Armor
		[2,3],	#Adventure Suit
		[4,5],	#Mage Robes
		[6,7],	#Chainmail
		[8,9],	#Birthday Suit
		]

var body
var armor
var weapon
var face
var eyes
var hair

var body_ops = 1
var armor_ops = 3
var weapon_ops = 7
var face_ops = 4
var eyes_ops = 6
var hair_ops = 9

var hair_color = Color(1,1,1)
var skin_color = Color(1,1,1)

var com

func _ready():
	com = get_node('/root/common')
	
	body = get_node('Body')
	armor = get_node('Armor')
	weapon = get_node('Weapon')
	face = get_node('Face')
	eyes = get_node('Eyes')
	hair = get_node('Hair')
	
	make_random_doll()

func make_random_doll():
	set_body(com.get_random(0,body_ops))
	set_armor(ARMOR_ADVENTURE)#(com.get_random(0,armor_ops))
	set_weapon(com.get_random(0,weapon_ops))
	set_face(com.get_random(0,face_ops))
	set_eyes(com.get_random(0,eyes_ops))
	set_hair(com.get_random(0,hair_ops))
	randomize()
	var r = randf()
	var g = randf()
	var b = randf()
	set_hair_color(Color(r,g,b))
	#var s = randf()+0.2
	#set_skin_color(Color(s,s,s))

func get_body():
	return body.get_frame()

func get_armor():
	return armor.get_frame()

func get_weapon():
	return weapon.get_frame()

func get_face():
	return face.get_frame()

func get_eyes():
	return eyes.get_frame()

func get_hair():
	return hair.get_frame()

func get_hair_color():
	return hair.get_modulate()


func set_body(c):
	body.set_frame(c)

func set_armor(c):
	armor.set_frame(armors[c][body.get_frame()])

func set_weapon(c):
	weapon.set_frame(c)

func set_face(c):
	face.set_frame(c)

func set_eyes(c):
	eyes.set_frame(c)

func set_hair(c):
	hair.set_frame(c)

func set_hair_color(c):
	hair.set_modulate(c)

func set_skin_color(c):
	body.set_modulate(c)
	face.set_modulate(c)
