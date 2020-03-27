extends Node2D

export(Array) var maps
var timer
var getPos = false
var distance
var startCreate = false
var cont = 0
var firstMap = true

func _ready():
	getPos = true
	
func _process(delta):
	if getPos:
		distance = getCameraPosition() + Vector2(1000, 0)
		getPos = false
		startCreate = true
	if startCreate:
		if getCameraPosition() >= distance:
			_spawn_map()
			if cont == 10:
				cont = 0
				remove_child(self.get_children()[0])
			getPos = true
	
func _spawn_map():
	cont += 1
	var index
	var new_map
	if (firstMap): 
		index = 0
		firstMap = false
	else: 
		index = randi()%maps.size()
	new_map = maps[index].instance()
	
	var pos = getCameraPosition() + Vector2(1000, -304)
	new_map.set_position(pos)
	add_child(new_map)
	
func getCameraPosition():
	return get_parent().get_node("Camera2D").get_camera_position()
