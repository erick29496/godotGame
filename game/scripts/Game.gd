extends Node

func _process(delta):
	get_node("CanvasLayer/Score").text = 'SCORE: ' + str(get_node("Player").getScore())

func goToDeathScreen():
	get_tree().change_scene("res://scenes/DeathScreen.tscn")
