extends VBoxContainer

class_name GridColumn

onready var buttonNode : Button  = $GridButton_0_0

func AddChildren(childCount : int, columnId : int):
	buttonNode.name = "GridButton_" + str(columnId)  + "_" + str(0)
	for i in childCount - 1:
		var buttonInst : Button = buttonNode.duplicate() as Button
		buttonInst.name = "GridButton_" + str(columnId) + "_" + str(i+1)
		add_child(buttonInst)
