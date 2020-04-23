extends Control

onready var hp_over = $HPOver
onready var hp_under = $HPUnder
onready var update_tween = $UpdateTween

func _on_hp_updated(hp):
	hp_over.value = hp
	update_tween.interpolate_property(hp_under, "value", hp_under.value, hp, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	update_tween.start()

func _on_max_fuel_updated(max_hp):
	hp_over.max_value = max_hp
	hp_under.max_value = max_hp
