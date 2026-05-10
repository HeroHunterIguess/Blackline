extends CanvasLayer

### upgrade paths ###
const melee_upgrades = ["basic", "long_melee"] # long_melee not implimented
const burst_upgrades = ["burst", "ground_slam", "super_slam"] # super_slam not implimented
const ranged_upgrades = ["laser_gun", "grenade", "frag_grenade"] # none of these are implimented

const movement_upgrades = ["dash", "double_jump", "air_freeze", "triple_jump"]
const repeating_upgrades = ["health_increase", "melee_damage_increase", "ranged_damage_increase", "burst_damage_increase"] # none of these are implimented

func close():
	get_tree().paused = false
	self.queue_free()

func _ready():
	get_tree().paused = true


### get upgrades ###
func _on_upgrade_1_button_down() -> void:
	
	close()

func _on_upgrade_2_button_down() -> void:
	
	close()
