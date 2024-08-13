extends VBoxContainer

class_name GridColumn

onready var buttonNode  = $GridButton

func AddChildren(childCount : int):
	for i in childCount - 1:
		var buttonInst = buttonNode.duplicate()
		add_child(buttonInst)
