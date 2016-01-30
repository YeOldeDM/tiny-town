
extends Sprite

var face
var eyes
var hair


func _ready():
	face = self
	eyes = get_node('Eyes')
	hair = get_node('Hair')

func set_head(face_choice,eyes_choice,hair_choice,hair_color):
	face.set_frame(face_choice)
	eyes.set_frame(eyes_choice)
	hair.set_frame(hair_choice)
	hair.set_modulate(hair_color)


