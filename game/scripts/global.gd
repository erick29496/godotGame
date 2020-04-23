extends Node

var score = 0
var shopingPoints = 0

func set_score(score):
	self.score = score
	self.shopingPoints += score
	
func get_score():
	return self.score
	
func get_shopingPoints():
	return self.shopingPoints
