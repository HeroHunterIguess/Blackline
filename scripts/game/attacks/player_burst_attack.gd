extends "res://scripts/autoloads/attack_methods.gd"

const DAMAGE = 60
const KNOCKBACK = 1395

func _on_area_entered(area: Area2D) -> void:
	deal_damage(area, DAMAGE + data.burst_damage_increase, KNOCKBACK)
	
	await get_tree().create_timer(0.08).timeout
	queue_free()

# scale up explosion quickly
func _process(_delta):
	$Explosion.scale += Vector2(global.SCALE_SPEED, global.SCALE_SPEED)
