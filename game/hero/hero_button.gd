
extends Button

var head
var owner

func _ready():
	head = get_node('Head')


func setup():
	set_text(owner.hero_name)
	head = get_node('Head')
	head.owner = owner
	head._ready()
	head.draw_head()

	
func _on_Button_pressed():
	get_node('/root/Game').select_hero(owner)
