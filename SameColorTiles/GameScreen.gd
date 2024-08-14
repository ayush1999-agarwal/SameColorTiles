extends Node2D

onready var gridController : GridController = $GridController as GridController

onready var timerVal : Label = $CanvasLayer/TimerText/TimerVal
onready var movementVal : Label = $CanvasLayer/MovementText/MovementVal

var timerCounter = 0
var movementCounter = 0

func _on_ResetButton_pressed():
	gridController.ResetGameBoard()
	
	
	timerCounter = 0
	timerVal.text = str(timerCounter)
	
	movementCounter = 0
	movementVal.text = str(movementCounter)
	
func IncMovementVal():
	movementCounter += 1
	movementVal.text = str(movementCounter)
