extends HBoxContainer
class_name GridRow

onready var gridColumnNode : GridColumn = $GridColumn

func AddChildren(childCount : int):
	for i in childCount - 1:
		var columnInst : GridColumn = gridColumnNode.duplicate() as GridColumn
		add_child(columnInst)
		columnInst.AddChildren(childCount,i+1)
	gridColumnNode.AddChildren(childCount,0)
