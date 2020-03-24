extends Camera2D

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
			futureTime = time + 5
			
		position.x += WALK_SPEED * delta
		
		if time >= futureTime:
			WALK_SPEED += 50
			futureTime = 0

func stop():
	WALK_SPEED = 0
