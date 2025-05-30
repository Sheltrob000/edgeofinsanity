extends CharacterBody2D

const SPEED = 800
const DASHSPEED = 4000
const JUMPSPEED = -2800
const ACCERLATION = 500

var direction = 0
var canDash := true
var canDoubleJump := true
var canChangeDirection = true
var isDashing = false
var speed := 0
var CanBeHit := true


func _ready():
	$ui.setHealth($Health_Component.health)
	canBeHit(CanBeHit)


func canBeHit(canBeHit : bool):
	$Health_Component.monitorable = canBeHit
	$Health_Component.visible = canBeHit
	
	if !canBeHit:
		$Health_Component.position = Vector2(1000000, 1000000)#dont you love stupid solutions
	else:
		$Health_Component.position = Vector2(0, 0)







func _physics_process(delta: float) -> void:
	$ui.setHealth($Health_Component.health)

	canBeHit(CanBeHit)


	if isDashing:
		speed = DASHSPEED
	else:
		speed = SPEED

	if canChangeDirection:
		direction = Input.get_axis("left", "right")
	velocity.x = move_toward(velocity.x, speed * direction, ACCERLATION)
	move_and_slide()
	
	if !is_on_floor():
		# if velocity.y < 1500:
		velocity += get_gravity()

	if Input.is_action_just_pressed("jump") and (is_on_floor() or canDoubleJump):
		velocity.y = JUMPSPEED
		canDoubleJump = false
	if is_on_floor():
		canDoubleJump = true
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0
	if isDashing:
		velocity.y = 0
	
	if Input.is_action_just_pressed("dash") and canDash and direction != 0:
		isDashing = true
		canChangeDirection = false
		canDash = false
		$dashTimer.start()
		$dashCooldown.start()

	spriteDirection()
	spriteAnimation()



	if Input.is_action_just_pressed("attack") and canChangeDirection:
		$AttackComponent.StartAttack()






func spriteDirection():
	if direction == 1:
		$Sprite2D.flip_h = false
		$AnimatedSprite2D.flip_h = false

		$AttackComponent.scale.x = 1
	elif direction == -1:
		$Sprite2D.flip_h = true
		$AnimatedSprite2D.flip_h = true

		$AttackComponent.scale.x = -1



func spriteAnimation():
	if direction != 0 and !isDashing:
		$AnimatedSprite2D.play("walking")
	elif isDashing and direction != 0:
		$AnimatedSprite2D.play("dashing")
	else:
		$AnimatedSprite2D.play("still")


func _on_dash_timer_timeout() -> void:
	isDashing = false
	canChangeDirection = true


func _on_dash_cooldown_timeout() -> void:
	canDash = true


func _on_health_component_attacked(attack:Attack) -> void:
	velocity = Vector2(0, 0)
	var knockbackForce = attack.knockbackMultiplyer
	velocity.x += (global_position.x - attack.xposition) * knockbackForce
	velocity.y += (global_position.y - attack.yposition) * 10
	$AnimatedSprite2D.self_modulate.a = .5
	CanBeHit = false
	$iframes.start()

func _on_iframes_timeout() -> void:
	$AnimatedSprite2D.self_modulate.a = 1
	CanBeHit = true
