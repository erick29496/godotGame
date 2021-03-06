extends KinematicBody2D
 
const JUMP_FORCE = 450
const GRAVITY = 25
const MAX_FALL_SPEED = 1000
const LIMIT_Y = 25
const MIN_Y = 800
const MAX_FUEL = 500
const SPEED = 50
var FUEL = Global.get_fuel()

onready var sprite = $AnimatedSprite
 
var y_velo = 0
var facing_right = false
var fuel = FUEL

var time = 0
var futureTime = 0
var dead = false
var score = 0
var multiplier = 1
var contScore = 0
var speed = 0
 
func _physics_process(delta):
	var walkSpeed = get_parent().get_node("Camera2D").getSpeed()
	if position.y < LIMIT_Y:
		position.y = LIMIT_Y
	elif position.y > MIN_Y:
		die()
	if getDistancePlayerCamera() <= 40:
		speed = 0	
	move_and_slide(Vector2(walkSpeed + speed, y_velo), Vector2(0, -1))
	y_velo += GRAVITY
	
	if dead:
		if $AnimatedSprite.frame == 9:
			$AnimatedSprite.stop()
			Global.set_score(score)
			get_parent().goToDeathScreen()
			
	else:		
		if contScore == 10:
			score += multiplier
			contScore = 0
		contScore += 1
		var grounded = is_on_floor()
		if grounded:
			if fuel < FUEL:
				fuel = FUEL
			$AnimatedSprite.play("run")
		y_velo += GRAVITY
		if fuel > 0 and Input.is_action_pressed("ui_select"):
			$AnimatedSprite.play("jump")
			y_velo = -JUMP_FORCE
			fuel -= 1
		if grounded and y_velo >= 5:
			y_velo = 5
		if y_velo > MAX_FALL_SPEED:
			y_velo = MAX_FALL_SPEED
		updateFuel(fuel)
		
func die():
	dead = true
	speed = 0;
	$AnimatedSprite.play("die")
	get_parent().get_node("Camera2D").stop()

func restoreFuel():
	fuel += FUEL
	if fuel > MAX_FUEL:
		fuel = MAX_FUEL
	updateFuel(fuel)

func updateFuel(fuel):
	get_parent().get_node("CanvasLayer/FuelBar")._on_fuel_updated(fuel)
	
func increaseMultiplayer():
	multiplier += 1
	
func getScore():
	return score

func getDistancePlayerCamera():
	return (get_parent().get_node("Camera2D").get_camera_position().x - position.x)
	
func resetPosition():
	speed = SPEED
