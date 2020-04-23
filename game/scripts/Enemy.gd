extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	get_parent().get_parent().get_node('Player').die()
	$AnimationPlayer.play("Explote")


func _on_Area2D_area_entered(area):
	get_parent().get_parent().get_node("Camera2D/Uruguru").takeDamage(10)
	position.y = 350
	$AnimationPlayer.play("Explote")
	yield($AnimationPlayer, "animation_finished")
	queue_free()
