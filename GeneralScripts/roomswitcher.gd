extends Node

var x = -3750
var y = -150

func switchScene(scene, x, y):
	get_tree().change_scene_to_file(scene)
	self.x = x
	self.y = y

func getx():
	return x
func gety():
	return y
