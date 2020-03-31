extends Node2D

export(Array) var fuel

const MAX_SECONDS = 10
var timer
var seconds = MAX_SECONDS

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(seconds)
	timer.start()
	
func _on_timer_timeout():
	if get_parent().get_node("Camera2D").getSpeed() >= 220:
		seconds = randi()%MAX_SECONDS+5
		timer.set_wait_time(seconds)
		_spawn_object()
	
func _spawn_object():
	var index
	var new_fuel
	
	index = randi()%fuel.size()
	new_fuel = fuel[index].instance()
	var pos = get_parent().get_node("Camera2D").get_camera_position() + Vector2(700, 0)
	
	pos.y = randi()%340+85
	new_fuel.set_position(pos)
	add_child(new_fuel)
	
