extends Area2D
class_name AttackComponent

@export var damage : int
@export var attackLength : float
@export var attackCooldown : float



func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
    attack.damage = damage
    area.damage(attack)
