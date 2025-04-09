extends Area2D
class_name levelSwitcher

@export var scene : PackedScene

func _on_area_entered(area:Health_Component) -> void:
    print("hello world")
    get_tree().change_scene_to_packed(scene)