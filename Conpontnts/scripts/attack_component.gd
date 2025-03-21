extends Area2D
class_name AttackComponent

@export var damage : int
@export var attackLength : float
@export var attackCooldown : float

var canAttack := true

func _ready():
	visible = false
	monitoring = false

func startAttack():
	if canAttack:
		visible = true
		monitoring = true
		#$attackLength.start()
		#$cooldown.start()
		canAttack = false






func _on_cooldown_timeout() -> void:
	canAttack = true

func _on_attack_length_timeout() -> void:
	visible = false
	monitoring = false





func _on_area_entered(area:Health_Component) -> void:
	var attack = Attack.new()
	attack.damage = damage
	area.damage(attack)
