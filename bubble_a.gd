extends Button
var clicked=0

#small easter egg
func _pressed():
	clicked=clicked+1
	if(clicked==100):
		print("wow! 100 times")
		self.get_parent().get_parent().get_parent().increase_p100()
		clicked=0
	else:
		print("pressed "+ str(clicked) +" times")
