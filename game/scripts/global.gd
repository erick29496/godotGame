extends Node

var score = 0
var shopingPoints = 0
var fuel = 80

func set_score(score):
	self.score = score
	self.shopingPoints += score
	
func get_score():
	return self.score
	
func get_shopingPoints():
	return self.shopingPoints
	
func set_shopingPoints(points):
	self.shopingPoints = points
	
func get_fuel():
	return self.fuel
	
func upgrade_fuel():
	self.fuel += 100
