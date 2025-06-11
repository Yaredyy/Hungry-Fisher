extends CollisionShape2D
var clicked = 0

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and (abs(event.position.x-self.get_parent().position.x)<25):
			if(clicked > 9):
				get_parent().queue_free()
				get_parent().get_parent().increase_pPink()
			else:
				clicked=clicked+1
