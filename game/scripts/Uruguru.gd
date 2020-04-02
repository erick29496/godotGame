extends Area2D

var playerDead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !playerDead:
		var distance = getPlayerDistance()
		if distance > 250:
			get_node("AnimationPlayer").play("eat")
		else:
			get_node("AnimationPlayer").play("mouth")

func _on_Uruguru_body_entered(body):
	playerDead = true
	get_parent().get_parent().get_node('Player').die()
	get_node("AnimationPlayer").stop()
	
func getPlayerDistance():
	return get_parent().get_parent().get_node('Player').getDistancePlayerCamera()
