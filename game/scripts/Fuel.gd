extends Area2D

const LIMIT_BOTTOM_Y = 500
const SPEED = 5
const LIMIT_TOP_Y = 25

var currentY = 0
var goDown = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().get_node("Camera2D").get_viewport())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !goDown:
		position.y -= SPEED
		if position.y < LIMIT_TOP_Y:
			goDown = true
	else:
		position.y += SPEED
		if position.y > LIMIT_BOTTOM_Y:
			goDown = false
	

func _on_Area2D_body_entered(body):
	get_parent().get_node('Player').restoreFuel()
	queue_free()
