extends Node2D

export var gridSize : int

onready var gridRow : GridRow = $GridRow

func _ready():
	gridRow.AddChildren(gridSize)

