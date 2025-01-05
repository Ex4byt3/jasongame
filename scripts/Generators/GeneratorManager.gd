extends Node

var generators : Array = [] # array to hold all generators

func _process(delta):
	for generator in generators:
		Global.points += generator.rate * generator.count * delta

