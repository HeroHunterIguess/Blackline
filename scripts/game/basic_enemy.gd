extends "res://scripts/autoloads/enemy_methods.gd"

const JUMP_FORCE = 550
const SOFT_SPEED_CAP = 325
const DAMAGE = 8

var health = 100

### update physics and movement ###
func _physics_process(delta: float) -> void:
	# move roughly towards player but not fully
	enemy_methods.movement(self, 3, SOFT_SPEED_CAP, delta, JUMP_FORCE)

# check for death
func _process(_delta):
	if (health <= 0):
		die()

# deal damage to player when touched
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.get_parent().take_dmg(DAMAGE)
