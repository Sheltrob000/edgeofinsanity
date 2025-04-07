extends Node
class_name Attack

var damage = 0
var knockbackMultiplyer = 0
var xposition = 0
var yposition = 0




func withDamage(damage : int) -> Attack:
    self.damage = damage
    return self

func WithKnockbackMultiplyer(knockbackMultiplyer : float) -> Attack:
    self.knockbackMultiplyer = knockbackMultiplyer
    return self

func withXPosition(xposition : float):
    self.xposition = xposition
    return self

func withYPosition(yposition : float):
    self.yposition = yposition
    return self