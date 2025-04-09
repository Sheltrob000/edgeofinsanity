extends Area2D
class_name Health_Component

@export var MAXHEALTH = 1
var health = 0
signal attacked(attack:Attack)

func _ready():
	health = MAXHEALTH


func damage(attack : Attack):
	health -= attack.damage
	attacked.emit(attack)

	if health <= 0:
		get_parent().queue_free()
	
func canBeHit():
	monitorable = true

func cantBeHit():
	monitorable = false
