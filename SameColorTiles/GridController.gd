extends Node2D

export var gridSize : int

onready var gridRow : GridRow = $GridRow

func _ready():
	gridRow.AddChildren(gridSize)

	for column in gridRow.get_children():
		for button in column.get_children():
			button.connect("pressed", self, "_on_GridButton_pressed", [button])



func _on_GridButton_pressed(which : Button):
	var pressedButton : Vector2 = Utils.GetGridButtonFromName(which.name)
	which.modulate = Color(0,0,0,1)
	
	var adjacentBtnIds = Utils.GetAdjacentBtns(pressedButton,gridSize)
	
	for btnId in adjacentBtnIds:
		gridRow.get_child(btnId[0]).get_child(btnId[1]).modulate = Color(0,0,0,1)
