extends Label

func _process(delta: float):
	text=str(self.get_parent().get_parent().get_point())
