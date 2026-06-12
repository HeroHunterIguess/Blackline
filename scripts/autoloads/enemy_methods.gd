extends CharacterBody2D
# has all the base methods for enemy types etc

### base hit functions ###
func take_damage(health, amount):
	health -= amount
	return health
	# hurt anim or sfx?

func take_kb(force, is_right):
	if is_right:
		velocity.x += force
	elif !is_right:
		velocity.x -= force
	velocity.y -= global.VERTICAL_KNOCKBACK

# necessary variables for die funciton
var rng = RandomNumberGenerator.new()
const health_pickup_preload = preload("res://scenes/objects/health_pickup.tscn")

# kill enemy and drop pickups
func die():
	# sometimes drop health pickup
	var random_number = rng.randi_range(1, 3)
	
	if random_number == 1:
		var health_pickup = health_pickup_preload.instantiate()
		health_pickup.global_position = self.global_position
		get_parent().add_child(health_pickup)
	
	data.score += 1
	queue_free()

func movement(obj, randmax, SOFT_SPEED_CAP, delta, JUMP_FORCE):
	# move roughly towards player but not fully
	var random_number = rng.randi_range(1, randmax)
	
	if random_number == 1:
		if get_tree().root.find_child("player",true,false).to_local(obj.global_position).x >= 0:
			obj.velocity.x = move_toward(obj.velocity.x, SOFT_SPEED_CAP, global.FRICTION * delta)
		elif get_tree().root.find_child("player",true,false).to_local(obj.global_position).x < 0:
			obj.velocity.x = move_toward(obj.velocity.x, -SOFT_SPEED_CAP, global.FRICTION * delta)
	else:
		if get_tree().root.find_child("player",true,false).to_local(obj.global_position).x >= 0:
			obj.velocity.x = move_toward(obj.velocity.x, -SOFT_SPEED_CAP, global.FRICTION * delta)
		elif get_tree().root.find_child("player",true,false).to_local(obj.global_position).x < 0:
			obj.velocity.x = move_toward(obj.velocity.x, SOFT_SPEED_CAP, global.FRICTION * delta)
	
	# jump if at wall/other enemy
	if obj.is_on_wall() && obj.is_on_floor():
		obj.velocity.y -= JUMP_FORCE
	
	# apply gravity
	obj.velocity.y += global.GRAVITY * delta
	if obj.velocity.y > global.TERMINAL_VELOCITY:
		obj.velocity.y = global.TERMINAL_VELOCITY
	
	# update position based on velocity
	obj.move_and_slide()
