extends Area2D
class_name AttackComponent2

@export var damage : int


func timerRun():
	$Timer.start()

func _on_timer_timeout() -> void:
	print("hello")
