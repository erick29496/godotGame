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


func _on_Area2D_area_entered(area):
	get_parent().position.y = 350
	get_parent().get_node("AnimationPlayer").play("Break")
	yield(get_parent().get_node("AnimationPlayer"), "animation_finished")
	get_parent().queue_free()

