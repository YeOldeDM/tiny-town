
extends Sprite

var owner
var face
var eyes
var hair


func _ready():
	face = self
	eyes = get_node('Eyes')
	hair = get_node('Hair')

func draw_head():
	var data = owner.doll.doll_data
	var hair_color = owner.doll.hair_color
	face.set_frame(data['face'])
	eyes.set_frame(data['eyes'])
	hair.set_frame(data['hair'])
	hair.set_modulate(hair_color)

func set_head(face_choice,eyes_choice,hair_choice,hair_color):
	face.set_frame(face_choice)
	eyes.set_frame(eyes_choice)
	hair.set_frame(hair_choice)
	hair.set_modulate(hair_color)


