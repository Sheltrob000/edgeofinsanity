extends Node2D

func _ready() -> void:
	$Player.position.x = TransitionAnimation.getx()
	$Player.position.y = TransitionAnimation.gety()


func _on_transitionright_area_entered(area: Area2D) -> void:
	TransitionAnimation.change_Scene("res://scenes/room_3_test.tscn", -4700, 600)

func _on_transition_down_area_entered(area: Area2D) -> void:
	TransitionAnimation.change_Scene("res://scenes/room_1_test.tscn", -3750, -150)
