extends Area2D
class_name Consistant_Attack_Component

@export var damage : int
@export var selfHealthComponent : Health_Component


func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
	attack.withDamage(damage)
	area.damage(attack)
