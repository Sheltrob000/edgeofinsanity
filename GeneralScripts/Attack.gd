extends Node
class_name Attack

var damage = 0
var knockbackMultiplyer = 0




func withDamage(damage : int) -> Attack:
    self.damage = damage
    return self

func WithKnockbackMultiplyer(knockbackMultiplyer : float) -> Attack:
    self.knockbackMultiplyer = knockbackMultiplyer
    return self