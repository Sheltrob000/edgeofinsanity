extends CanvasLayer


var x = -3750
var y = -150


func fadeIn():
	$ColorRect/AnimationPlayer.play("fade")
	#await get_tree().create_timer(.5).timeout
func fadeOut():
	$ColorRect/AnimationPlayer.play_backwards("fade")
	#await get_tree().create_timer(.5).timeout



func change_Scene(scene, x, y):
	fadeIn()
	await  get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file(scene)
	self.x = x
	self.y = y
	await get_tree().create_timer(1).timeout
	fadeOut()


func getx():
	return x
func gety():
	return y
