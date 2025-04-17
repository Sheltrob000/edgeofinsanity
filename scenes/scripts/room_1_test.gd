extends Node2D

func _ready():
	$Player.position.x = Roomswitcher.getx()
	$Player.position.y = Roomswitcher.gety()


func _on_switchtolevel_2_area_entered(area: Health_Component) -> void:
	print("hello")
	Roomswitcher.switchScene("res://scenes/room_2_test.tscn", -3400, -250)
	
