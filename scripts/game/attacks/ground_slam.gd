extends "res://scripts/autoloads/attack_methods.gd"

const DAMAGE = 55
const KNOCKBACK = 1250

### spawn and deal damage ###
func _on_area_entered(area: Area2D) -> void:
	deal_damage(area, DAMAGE, KNOCKBACK)
	
	# automatically disapear after a short period to prevent weird bugs of it not disapearing
	await get_tree().create_timer(0.75).timeout
	queue_free()
