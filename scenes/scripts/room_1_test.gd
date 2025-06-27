extends Node2D

func _ready():
	$Player.position.x = TransitionAnimation.getx()
	$Player.position.y = TransitionAnimation.gety()
	$Player.setCameraLimit(-2400, 191, -4200, 6000)


func _on_switchtolevel_2_area_entered(_area: Health_Component) -> void:
	print("hello")
	TransitionAnimation.change_Scene("res://scenes/room_2_test.tscn", -3400, -300)
	
	


func _on_transitionleft_area_entered(_area: Health_Component) -> void:
	TransitionAnimation.change_Scene("res://scenes/room_4_test.tscn",-4150 ,15000 )
