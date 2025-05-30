extends Area2D
class_name Consistant_Attack_Component

@export var damage : int
@export var knockbackMultiplyer : float
@export var hitstop : float


func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
	attack.withDamage(damage).WithKnockbackMultiplyer(knockbackMultiplyer).withXPosition(global_position.x).withYPosition(global_position.y)
	area.damage(attack)
	get_tree().paused = true
	await get_tree().create_timer(hitstop).timeout
	get_tree().paused = false
