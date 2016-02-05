
extends ItemList

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	for i in range(10):
		add_item("TEST")
	show()


