extends Node2D

export(Array) var enemies
export(Array) var obstacles

const MAX_SECONDS = 2
const SWAP_ENEMIES = 8
var timer
var seconds = MAX_SECONDS
var cont = 0
var enemySelected = 0

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(seconds)
	timer.start()
	
func _on_timer_timeout():
	if get_parent().get_node("Camera2D").getSpeed() >= 220:
		if cont == SWAP_ENEMIES:
			enemySelected = randi()%3
			cont = 0
		_spawn_object()
	if	get_parent().get_node("Camera2D").getSpeed() >= 300:
		seconds = 1
		timer.set_wait_time(seconds)
	if	get_parent().get_node("Camera2D").getSpeed() >= 400:
		seconds = 0.75
		timer.set_wait_time(seconds)	
	if	get_parent().get_node("Camera2D").getSpeed() >= 500:
		seconds = 0.50
		timer.set_wait_time(seconds)		
	
func _spawn_object():
	var index
	var new_enemy
	cont += 1
	var list
	
	if enemySelected == 0: # 0 = obstacles
		list = obstacles	
	elif enemySelected == 1: # 1 = enemies
		list = enemies
	else: # obstacles + enemies
		var option = randi()%2
		if option == 0:
			list = obstacles
		else:
			list = enemies	
	index = randi()%list.size()
	new_enemy = list[index].instance()
	new_enemy.set_rotation(randi()%360)
	var pos = get_parent().get_node("Camera2D").get_camera_position() + Vector2(700, 0)
	
	pos.y = randi()%380+85
	new_enemy.set_position(pos)
	add_child(new_enemy)
	
