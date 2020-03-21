extends KinematicBody2D
 
const MOVE_SPEED = 500
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

onready var sprite = $AnimatedSprite
 
var y_velo = 0
var facing_right = false
var fuel = 100
 
func _physics_process(delta):
	
	var move_dir = 0
	if Input.is_action_pressed("ui_right"):
		move_dir += 1
		$AnimatedSprite.play()
	if Input.is_action_pressed("ui_left"):
		move_dir -= 1
		$AnimatedSprite.play()
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))

	var grounded = is_on_floor()
	if grounded:
		fuel = 100
	y_velo += GRAVITY
	if fuel > 0 and Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
		y_velo = -JUMP_FORCE
		fuel -= 25
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
   
	if !facing_right and move_dir < 0:
		flip()
	if facing_right and move_dir > 0:
		flip()
 
func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h
