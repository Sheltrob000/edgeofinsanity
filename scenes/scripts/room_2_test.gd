extends Node2D


func _ready():
	$Player.position.x = TransitionAnimation.getx()
	$Player.position.y = TransitionAnimation.gety()
	print($Player.position)


func _on_levelswitcher_left_area_entered(area:Health_Component) -> void:
	print("hello")
	TransitionAnimation.change_Scene("res://scenes/room_1_test.tscn", 5000, -250)


func _on_levelswitcherup_area_entered(area:Health_Component) -> void:
	print("hell room 3")
	TransitionAnimation.change_Scene("res://scenes/room_3_test.tscn", 3800, 0)
