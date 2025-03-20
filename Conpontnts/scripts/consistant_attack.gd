extends Area2D

@export var damage : int


func _on_area_entered(area:Health_Component) -> void:
    var attack = Attack.new()
    attack.damage = damage

	area.damage(attack)
