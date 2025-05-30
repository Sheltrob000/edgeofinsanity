extends CharacterBody2D

const SPEED = 500
const ACCERLATION = 500

var direction = 1
var canturn := true


func _physics_process(delta):
	if !is_on_floor():
		velocity += get_gravity()
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCERLATION)
	move_and_slide()
	
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
	if (!$leftRayCast.is_colliding() or !$rightRayCast.is_colliding()) and canturn:
		direction *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
		canturn = false
		$turntimer.start()


func _on_turntimer_timeout() -> void:
	canturn = true


func _on_health_component_attacked(attack:Attack) -> void:
	var knockbackForce = attack.knockbackMultiplyer
	velocity.x += (global_position.x - attack.xposition) * knockbackForce
	velocity.y += (global_position.y - attack.yposition) * knockbackForce
