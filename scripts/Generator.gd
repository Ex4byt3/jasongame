class_name Generator extends Control

@export var generatorName : String = "Default Generator"
@export var generatorSpeed : float = 2.0
@export var generatedAmount : int = 1
var button : Button
var label : Label
var timer : Timer
var cost : int = 1
var count : int = 0

func buy_generator() -> void :
	if Global.points >= cost:
		if count == 0 :
			_start_timer()
		Global.points -= cost
		count += 1
		increase_cost()
	else:
		insufficient_funds()

func increase_cost() -> void : 
	cost += 1 # to be changed

func insufficient_funds() -> void :
	pass 

func _update_button_text() -> void :
	button.text = "Cost : %d" % cost

func _update_label_text() -> void :
	label.text = str(count) + " " + generatorName
	if count != 1 :
		label.text += "s"

func _connect_signals() -> void :
	timer.timeout.connect(_on_timer_timeout)
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void :
	buy_generator()
	_update_button_text()
	_update_label_text()

func _on_timer_timeout() -> void :
	if count == 0:
		pass # could also just diable the timer if there are 0
	Global.points += generatedAmount * count

func _get_nodes() -> void :
	button = get_node("Button")
	label = get_node("Label")
	timer = get_node("Timer")

func _set_timer() -> void :
	timer.wait_time = generatorSpeed

func _start_timer() -> void :
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready() -> void :
	_get_nodes()
	_connect_signals()
	_update_label_text()
