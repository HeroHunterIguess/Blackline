extends "res://scripts/autoloads/attack_methods.gd"

const DAMAGE = 50
const KNOCKBACK = 270

func _on_area_entered(area: Area2D) -> void:
	deal_damage(area, DAMAGE, KNOCKBACK)

func _process(_delta):
	if get_tree().root.find_child("player",true,false).to_local(self.global_position).x >= 0:
		$Attack.global_position.x += 0.8
		$CollisionShape2D.global_position.x += 0.8
	else:
		$Attack.global_position.x -= 0.8
		$CollisionShape2D.global_position.x -= 0.8
