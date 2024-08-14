extends Node2D

onready var gridController : GridController = $GridController as GridController

onready var timerVal : Label = $CanvasLayer/TimerText/TimerVal
onready var movementVal : Label = $CanvasLayer/MovementText/MovementVal

var timerCounter = 0
var movementCounter = 0

func _ready():
	var timer = Timer.new()
	add_child(timer)
	
	timer.wait_time = 1  # Set the timer to trigger every 1 seconds
	timer.autostart = true
	timer.one_shot = false
	
	# Connect the timer's timeout signal to our function
	timer.connect("timeout", self, "on_timer_timeout")
	timer.start()

func on_timer_timeout():
	timerCounter += 1
	timerVal.text = str(timerCounter)


func _on_ResetButton_pressed():
	gridController.ResetGameBoard()
	
	
	timerCounter = 0
	timerVal.text = str(timerCounter)
	
	movementCounter = 0
	movementVal.text = str(movementCounter)
	
func IncMovementVal():
	movementCounter += 1
	movementVal.text = str(movementCounter)
