extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Score").text = str(Global.get_shopingPoints()) + " puntos"
	get_parent().get_node("Fuel").text = "Fuel: " + str(Global.get_fuel())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().get_node("Score").text = str(Global.get_shopingPoints()) + " puntos"
	get_parent().get_node("Fuel").text = "Fuel: " + str(Global.get_fuel())
