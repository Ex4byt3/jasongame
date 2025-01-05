class_name Generator extends Node


# generator properties
@export var rate : float = 1.0
@export var cost_scaling_function : Callable
@export var cost : int = 1
@export var count : int = 0

@export var multiplier : float = 1.0

var accumulated_points : float = 0

# nodes
var button : Button
var label : Label

func buy_generator() -> void :
	if Global.points >= cost:
		Global.points -= cost
		count += 1
		_update_cost()
	else:
		insufficient_funds()

func _update_cost() -> void :
	cost = cost_scaling_function.call()

func insufficient_funds() -> void :
	pass 

func _update_button_text() -> void :
	button.text = "Cost : %d" % cost

func _update_label_text() -> void :
	label.text = str(count) + " " + name
	if count != 1 :
		label.text += "s"

func _connect_signals() -> void :
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void :
	buy_generator()
	_update_button_text()
	_update_label_text()

func _get_nodes() -> void :
	button = get_node("Button")
	label = get_node("Label")

	