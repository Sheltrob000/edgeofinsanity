extends Area2D
class_name Attack_Component

@export var damage : int
@export var knockbackMultiplyer : float
@export var Attackduration : float
@export var AttackCooldown : float

signal attackEnded

var canAttack := true

func _ready():
	$attackLength.wait_time = Attackduration
	$cooldown.wait_time = AttackCooldown
	visible = false
	monitoring = false

func StartAttack():
	if canAttack:
		canAttack = false
		monitoring = true
		visible = true
		$attackLength.start()
	else:
		attackEnded.emit()




func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
	attack.withDamage(damage).WithKnockbackMultiplyer(knockbackMultiplyer).withXPosition(global_position.x).withYPosition(global_position.y)
	area.damage(attack)






func _on_attack_length_timeout() -> void:
	visible = false
	monitoring = false
	$cooldown.start()
	attackEnded.emit()


func _on_cooldown_timeout() -> void:
	canAttack = true
