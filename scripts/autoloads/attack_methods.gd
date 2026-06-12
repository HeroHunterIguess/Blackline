extends Node

func deal_damage(area, damage, kb):
	var object = area.get_parent()
	if !object.is_in_group("player") && !area.is_in_group("range_detection"):
		if object.has_method("take_damage"):
			object.health = object.take_damage(object.health, damage)
		
		if object.has_method("take_kb"):	
			if area.to_local(self.global_position).x >= 0:
					object.take_kb(kb, false)
			else:
					object.take_kb(kb, true)
