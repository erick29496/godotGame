extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_UpgradeFuel_pressed():
	var points = Global.get_shopingPoints()
	var fuel = Global.get_fuel()
	if (points >= fuel):
		Global.upgrade_fuel()
		Global.set_shopingPoints(points - fuel)
