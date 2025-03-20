extends Area2D
class_name Health_Component

@export var MAXHEALTH = 1
var health = 0

func _ready():
    health = MAXHEALTH


func damage(attack : Attack):
    health -= attack.damage
    print(health)

    if health <= 0:
        get_parent().queue_free()
