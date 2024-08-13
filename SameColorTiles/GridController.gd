extends Node2D

export var gridSize : int

onready var gridRow : GridRow = $GridRow

func _ready():
	gridRow.AddChildren(gridSize)

	for column in gridRow.get_children():
		for button in column.get_children():
			button.connect("pressed", self, "_on_GridButton_pressed", [button])



func _on_GridButton_pressed(which : Button):
	print ("Button " + which.name + " was pressed.")
