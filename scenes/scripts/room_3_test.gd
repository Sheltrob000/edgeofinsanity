extends Node2D

func _ready():
	$Player.position.x = Roomswitcher.getx()
	$Player.position.y = Roomswitcher.gety()


func _on_transition_down_area_entered(area:Area2D) -> void:
	Roomswitcher.switchScene("res://scenes/room_2_test.tscn", 10150, -2000)


func _on_transition_left_area_entered(area:Area2D) -> void:
	pass # Replace with function body.
