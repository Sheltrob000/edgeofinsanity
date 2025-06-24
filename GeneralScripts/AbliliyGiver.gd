extends Node
class_name Ability_giver

var canDoubleJump := false
var canDash :=false
var health := 0

func with_double_jump(canDoubleJump:bool):
	self.canDoubleJump = canDoubleJump

func with_dash(canDash:bool):
	self.canDash = canDash
	return self

func with_health(health:int):
	self.health = health
	return self
