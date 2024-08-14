extends Node2D
onready var gridController : GridController = $GridController as GridController

func _on_ResetButton_pressed():
	gridController.ResetGameBoard()
