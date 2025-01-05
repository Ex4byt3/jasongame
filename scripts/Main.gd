extends Control

var pointsLabel : Label
var mainButton : Button
var mult : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_nodes()
	_connect_signals()

func _get_nodes() -> void :
	pointsLabel = get_node("PointsLabel")
	mainButton = get_node("MainButton")

func _connect_signals() -> void :
	mainButton.pressed.connect(_mainButton_pressed)

func _mainButton_pressed() -> void :
	Global.points += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_points()

func _update_points() -> void :
	pointsLabel.text = "Points : %.3f" %Global.points
