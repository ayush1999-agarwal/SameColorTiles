extends HBoxContainer
class_name GridRow

onready var gridColumnNode : GridColumn = $GridColumn

func AddChildren(childCount : int):
	gridColumnNode.AddChildren(childCount)
	for i in childCount - 1:
		var columnInst : GridColumn = gridColumnNode.duplicate() as GridColumn
		add_child(columnInst)

