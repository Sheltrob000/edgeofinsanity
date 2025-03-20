extends CharacterBody2D

const SPEED = 800
const JUMPSPEED = -5000
const ACCERLATION = 300

var direction = 0



func _physics_process(delta: float) -> void:
	direction = Input.get_axis("left", "right")
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCERLATION)
	move_and_slide()
	
	if !is_on_floor():
		velocity += get_gravity()

	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMPSPEED

	spriteDirection()






func spriteDirection():
	if direction == 1:
		$Sprite2D.flip_h = false
	elif direction == -1:
		$Sprite2D.flip_h = true
