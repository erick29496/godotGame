extends Node2D

export(Array) var obstacles

const MAX_SECONDS = 8
var timer
var seconds = MAX_SECONDS
var cont = 0

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(seconds)
	timer.start()
	
func _on_timer_timeout():
	if get_parent().get_node("Camera2D").getSpeed() >= 220:
		if seconds == MAX_SECONDS:
			seconds = 2
			timer.set_wait_time(seconds)
		else:
			if cont == 4:
				seconds = MAX_SECONDS	
				cont = 0
				timer.set_wait_time(seconds)
			_spawn_object()
	
func _spawn_object():
	var index
	var new_obstacle
	cont += 1
	
	index = randi()%obstacles.size()
	new_obstacle = obstacles[index].instance()
	new_obstacle.set_rotation(randi()%360)
	var pos = get_parent().get_node("Camera2D").get_camera_position() + Vector2(700, 0)
	
	pos.y = randi()%340+85
	new_obstacle.set_position(pos)
	add_child(new_obstacle)
	

