extends Node

func GetGridButtonFromName(btnName : String) -> Vector2:
	var nameParts = btnName.split("_")
	return Vector2(int(nameParts[1]),int(nameParts[2]))

func GetAdjacentBtns(pressedId : Vector2, maxSize : int) -> Array:
	var adjacentBtns = []
	if pressedId [0] - 1 >= 0:
		adjacentBtns.append(Vector2(pressedId [0] - 1, pressedId[1])) 
	if pressedId [0] + 1 < maxSize:
		adjacentBtns.append(Vector2(pressedId [0] + 1, pressedId[1])) 
	if pressedId [1] - 1 >= 0:
		adjacentBtns.append(Vector2(pressedId [0], pressedId[1] - 1)) 
	if pressedId [1] + 1 < maxSize:
		adjacentBtns.append(Vector2(pressedId [0], pressedId[1] + 1)) 
	
	return adjacentBtns
