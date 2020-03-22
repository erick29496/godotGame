extends KinematicBody2D
 
const JUMP_FORCE = 600
const GRAVITY = 50
const MAX_FALL_SPEED = 1000
const LIMIT_Y = 25
const MAX_FUEL = 100

onready var sprite = $AnimatedSprite
 
var y_velo = 0
var facing_right = false
var fuel = MAX_FUEL

var time = 0
var futureTime = 0
 
func _physics_process(delta):
	$AnimatedSprite.play()
	var walkSpeed = get_parent().get_node("Camera2D").getSpeed()
	if position.y < LIMIT_Y:
		position.y = LIMIT_Y
	move_and_slide(Vector2(walkSpeed, y_velo), Vector2(0, -1))

	var grounded = is_on_floor()
	
	y_velo += GRAVITY
	if fuel > 0 and Input.is_action_pressed("ui_select"):
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
		y_velo = -JUMP_FORCE
		fuel -= 1
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
func die(body):
	queue_free()
	print("Player died")

func restoreFuel():
	fuel = MAX_FUEL
