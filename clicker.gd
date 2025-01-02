class_name Clicker extends Control

var label : Label
var button : Button
var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void :
	_get_nodes()
	_connect_signals()

func _get_nodes() -> void:
	label = get_node("Label")
	button = get_node("Button")
	
func _connect_signals() -> void :
	button.pressed.connect(_on_button_pressed) # connect pressed to a function in this script
	
func _on_button_pressed() -> void :
	_generate_points()
	
func _generate_points()  -> void :
	points += 1 # add 1 point to the total
	
func _update_label() -> void :
	label.text = "Points : %s" %points

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_label()
