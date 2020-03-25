extends Control

onready var fuel_over = $FuelOver
onready var fuel_under = $FuelUnder
onready var update_tween = $UpdateTween

func _on_fuel_updated(fuel):
	fuel_over.value = fuel
	update_tween.interpolate_property(fuel_under, "value", fuel_under.value, fuel, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	update_tween.start()

func _on_max_fuel_updated(max_fuel):
	fuel_over.max_value = max_fuel
	fuel_under.max_value = max_fuel
