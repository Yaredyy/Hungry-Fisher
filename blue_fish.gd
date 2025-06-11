extends CharacterBody2D
var time2 = Time.get_time_string_from_system()

@export var speed := 220.0

func _ready():
	# Initialize velocity with a random direction and speed
	velocity = Vector2.RIGHT.rotated(randf() * TAU) * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())

	var screen_size = get_viewport_rect().size
	if position.x < 0 or position.x > screen_size.x:
		velocity.x = -velocity.x
	if position.y < 0 or position.y > screen_size.y:
		velocity.y = -velocity.y

	# Clamp position inside screen bounds
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if(((int(Time.get_time_string_from_system().substr(6,2))-int(time2.substr(6,2)))>14)):
		self.get_parent().remove_p()
		self.queue_free()
	else:
		if ((int(Time.get_time_string_from_system().substr(6,2))-int(time2.substr(6,2)))<0):
			time2 = Time.get_time_string_from_system()
