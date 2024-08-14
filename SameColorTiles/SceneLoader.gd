extends Node

var sceneObjs = [
	preload("res://MainMenu.tscn"),
	preload("res://GameScreen.tscn"),
	preload("res://GameOver.tscn")
]

const SCENE_ID = {
MAIN = 0,
GAME = 1,
FINISH = 2
}

func LoadScene(sceneId : int):
	get_tree().change_scene_to(sceneObjs[sceneId])
