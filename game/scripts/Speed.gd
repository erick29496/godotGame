extends Node2D

export(Array) var speed

const MAX_SECONDS = 1
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
	if get_parent().get_node("Camera2D").getSpeed() >= 220 and get_parent().get_node("Player").getDistancePlayerCamera() > 100:
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
	var new_speed
	cont += 1
	
	index = randi()%speed.size()
	new_speed = speed[index].instance()
	var pos = get_parent().get_node("Camera2D").get_camera_position() + Vector2(700, 0)
	
	pos.y = randi()%340+85
	new_speed.set_position(pos)
	add_child(new_speed)
	
