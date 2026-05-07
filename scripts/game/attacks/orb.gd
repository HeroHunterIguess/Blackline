extends "res://scripts/autoloads/attack_methods.gd"

const DAMAGE = 55
const KNOCKBACK = 1250
var checking = true

func _process(_delta):
	checking = true
	
	await get_tree().create_timer(0.5).timeout

func _on_area_entered(area: Area2D) -> void:
	deal_damage(area, DAMAGE, KNOCKBACK)
