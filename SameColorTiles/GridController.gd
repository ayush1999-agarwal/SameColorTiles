extends Node2D

export var gridSize : int
export var colorCodes: Array

onready var gridRow : GridRow = $GridRow

var gridPerBoxState : Array

func _ready():
	gridRow.AddChildren(gridSize)

	for column in gridRow.get_children():
		for button in column.get_children():
			button.connect("pressed", self, "_on_GridButton_pressed", [button])
			
	for i in pow(gridSize,2):
		gridPerBoxState.append(0)

func _on_GridButton_pressed(which : Button):
	var pressedButton : Vector2 = Utils.GetGridButtonFromName(which.name)
	_toggleGridBoxColor(pressedButton)
	
	var adjacentBtnIds = Utils.GetAdjacentBtns(pressedButton,gridSize)
	
	for btnId in adjacentBtnIds:
		_toggleGridBoxColor(btnId)

func _toggleGridBoxColor(btnId : Vector2):
	#Toggle color by getting reverse of what is stored in per box state
	gridRow.get_child(btnId[0]).get_child(btnId[1]).modulate = colorCodes[1 - gridPerBoxState[btnId[0] * gridSize + btnId[1]]]
	gridPerBoxState[btnId[0] * gridSize + btnId[1]] = 1 - gridPerBoxState[btnId[0] * gridSize + btnId[1]]
