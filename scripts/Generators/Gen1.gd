extends Generator

func _ready():
	cost_scaling_function = scaling_function
	print("test")
	_get_nodes()
	_connect_signals()
	_update_label_text()
	get_parent().generators.append(self)

func scaling_function() -> float :
	return count

