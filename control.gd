extends Node2D

@export var redFish = preload("res://red_fish.tscn")
@export var pinkFish = preload("res://pink_fish.tscn")
@export var blueFish = preload("res://blue_fish.tscn")
@export var greenFish = preload("res://green_fish.tscn")
@export var brownFish = preload("res://brown_fish.tscn")
@export var orangeFish = preload("res://orange_fish.tscn")
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
		if(randi_range(0,1)==1):
			fish = pinkFish.instantiate()
		else:
			if(randi_range(0,1)==1):
				fish = blueFish.instantiate()
			else:
				if(randi_range(0,1)==1):
					fish = greenFish.instantiate()
				else:
					if(randi_range(0,1)==1):
						fish= brownFish.instantiate()
					else:
						fish= orangeFish.instantiate()
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
	if ((int(Time.get_time_string_from_system().substr(6,2))-int(time.substr(6,2)))>1):
		spawn_fish()
		time = Time.get_time_string_from_system()
	else:
		if ((int(Time.get_time_string_from_system().substr(6,2))-int(time.substr(6,2)))<0):
			time = Time.get_time_string_from_system()
			
	
	
func get_point():
	return point
	
func increase_pRed():
	point=point+1

func increase_pPink():
	point=point+2

func increase_pBlue():
	point=point+5
	
func increase_pGreen():
	point=point+15

func increase_pBrown():
	point=point+30

func increase_pOrange():
	point=point+50

func increase_p100():
	point=point+100

func remove_p():
	point=point-1
