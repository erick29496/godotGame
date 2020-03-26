extends Camera2D

const SPEED_INCREASE = 20

var WALK_SPEED = 100
var time = 0
var futureTime = 0

func _ready():
	set_process(true)
	
func getSpeed():
	return self.WALK_SPEED

func _process(delta):
	time += delta
	if WALK_SPEED != 0:
		
		if futureTime == 0:
			futureTime = time + 10
			increaseMultiplayer()
			
		position.x += WALK_SPEED * delta
		
		if time >= futureTime:
			WALK_SPEED += SPEED_INCREASE
			futureTime = 0

func stop():
	WALK_SPEED = 0
	
func increaseMultiplayer():
	get_parent().get_node("Player").increaseMultiplayer()
