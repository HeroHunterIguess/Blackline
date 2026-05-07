extends Node

func deal_damage(area, damage, kb):
	var object = area.get_parent()
	if !object.is_in_group("player") && !area.is_in_group("range_detection"):
		if object.has_method("take_damage"):
			object.health = object.take_damage(object.health, damage)
			
		if area.to_local(self.global_position).x >= 0:
			if object.has_method("take_kb"):
				object.take_kb(kb, false)
		else: 
			if object.has_method("take_kb"):
				object.take_kb(kb, true)
