extends Node2D

@export var redFish = preload("res://red_fish.tscn")
@export var pinkFish = preload("res://pink_fish.tscn")
@export var initial_fish_count := 10
var point = 0
var time
#var time2

func _ready():
	print("welcome to my fish tank game, beta 0.0.1")
	time = Time.get_time_string_from_system()
	#time2 = time

func spawn_fish():
	var fish
	if(randi_range(0,1)==1):
		fish = pinkFish.instantiate()
	else:
		fish = redFish.instantiate()
		
	# Position fish randomly inside screen
	var screen_size = get_viewport_rect().size
	fish.position = Vector2(
		randf_range(50, screen_size.x - 50),
		randf_range(50, screen_size.y - 50)
	)
	add_child(fish)

func _process(delta: float):
	print(int(Time.get_time_string_from_system().substr(6,2))-int(time.substr(6,2)))
	#print((int(Time.get_time_string_from_system().substr(6,2))-int(time2.substr(6,2))))
	if ((int(Time.get_time_string_from_system().substr(6,2))-int(time.substr(6,2)))>1):
		spawn_fish()
		time = Time.get_time_string_from_system()
	else:
		if ((int(Time.get_time_string_from_system().substr(6,2))-int(time.substr(6,2)))<0):
			time = Time.get_time_string_from_system()
			
	#if(((int(Time.get_time_string_from_system().substr(6,2))-int(time2.substr(6,2)))>5)):
		#if(get_children().size()>3):
			#remove_child(get_children()[2])
			#time2=Time.get_time_string_from_system()
	#else:
		#if ((int(Time.get_time_string_from_system().substr(6,2))-int(time2.substr(6,2)))<0):
			#time2 = Time.get_time_string_from_system()
	
	
func get_point():
	return point
	
func increase_pRed():
	point=point+1

func increase_pPink():
	point=point+2
	
func increase_p100():
	point=point+100

func remove_p():
	point=point-1
