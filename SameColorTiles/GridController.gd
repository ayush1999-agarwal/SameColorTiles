extends Node2D
class_name GridController

export var gridSize : int
export var colorCodes: Array

onready var gridRow : GridRow = $GridRow
var gridPerBoxState : Array
var startGridStatePerBox : Array
var lightColorCount : int

func _ready():
	randomize()
	gridRow.AddChildren(gridSize)

	for column in gridRow.get_children():
		for button in column.get_children():
			button.connect("pressed", self, "_on_GridButton_pressed", [button])
			
	_generateStartingGrid()
	_positionGrid()

func _positionGrid():
	#Position the grid at the center of screen horizontally
	print("Calculated grid length: " + str(gridRow.get_size()))
	set_position(Vector2(540 - gridRow.get_size().x/2, 100))
		
func _generateStartingGrid():
	for i in pow(gridSize,2):
		var randColorId = randi() % 2
		if randColorId == 0:
			lightColorCount += 1
		
		#To make sure all boxes do not start with complete state
		if i == pow(gridSize,2) - 1:
			if lightColorCount == pow(gridSize,2):
				lightColorCount -= 1
				randColorId = 1
			elif lightColorCount == 0:
				lightColorCount += 1
				randColorId = 0
		gridPerBoxState.append(randColorId)
		#Saving start state for reset functionality
		startGridStatePerBox.append(randColorId)
		gridRow.get_child(i / gridSize).get_child(i % gridSize).modulate = colorCodes[randColorId]

func _on_GridButton_pressed(which : Button):
	var pressedButton : Vector2 = Utils.GetGridButtonFromName(which.name)
	_toggleGridBoxColor(pressedButton)
	
	var adjacentBtnIds = Utils.GetAdjacentBtns(pressedButton,gridSize)
	
	for btnId in adjacentBtnIds:
		_toggleGridBoxColor(btnId)
	
	if lightColorCount == 0 || lightColorCount == pow(gridSize,2):
		print("Game Won")

func _toggleGridBoxColor(btnId : Vector2):
	#Toggle color by getting reverse of what is stored in per box state
	gridRow.get_child(btnId[0]).get_child(btnId[1]).modulate = colorCodes[1 - gridPerBoxState[btnId[0] * gridSize + btnId[1]]]
	gridPerBoxState[btnId[0] * gridSize + btnId[1]] = 1 - gridPerBoxState[btnId[0] * gridSize + btnId[1]]

	#Light Color is represented by 0 element in the array
	if gridPerBoxState[btnId[0] * gridSize + btnId[1]] == 0:
		lightColorCount += 1
	else:
		lightColorCount -= 1
	
func ResetGameBoard():
	gridPerBoxState = []
	for i in pow(gridSize,2):
		gridRow.get_child(i / gridSize).get_child(i % gridSize).modulate = colorCodes[startGridStatePerBox[i]]
		gridPerBoxState.append(startGridStatePerBox[i])
