extends Node
var canDoubleJump = true
var canDash = true
var health = 5
var maxHealth = 5



func load_abilities():
	var abilityGiver = Ability_giver.new()
	abilityGiver.with_health(health).with_dash(canDash).with_double_jump(canDoubleJump)
	return abilityGiver
	





func set_double_jump(ability:bool):
	canDoubleJump = ability

func set_dash(ability:bool):
	canDash = ability

func set_health(health:int):
	self.health = health
	print(health)
