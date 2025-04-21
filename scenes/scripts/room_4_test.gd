extends Node2D

func _ready() -> void:
	$Player.position.x = Roomswitcher.getx()
	$Player.position.y = Roomswitcher.gety()


func _on_transitionright_area_entered(area: Area2D) -> void:
	Roomswitcher.switchScene("res://scenes/room_3_test.tscn", -4700, 600)

func _on_transition_down_area_entered(area: Area2D) -> void:
	Roomswitcher.switchScene("res://scenes/room_1_test.tscn", -3750, -150)
