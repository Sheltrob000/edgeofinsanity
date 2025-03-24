extends Area2D
class_name Attack_Component

@export var damage : int
@export var knockbackMultiplyer : float
@export var Attackduration : float
@export var AttackCooldown : float

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




func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
	attack.withDamage(damage).WithKnockbackMultiplyer(knockbackMultiplyer)
	area.damage(attack)






func _on_attack_length_timeout() -> void:
	visible = false
	monitoring = false
	$cooldown.start()


func _on_cooldown_timeout() -> void:
	canAttack = true
	print("can attack")
