extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -10.0
const SMALL_JUMP_VELOCITY = -400
var state :String= "Movement"
var mouse_pos: Vector2= Vector2.ZERO
var starting_mouse_pos: Vector2 = Vector2.ZERO
var mouse_vector: Vector2 = Vector2.ZERO
var mouse_distance: float= 0
var encounter :bool = false
var HP :int = 100
var TP_pos :Vector2 = Vector2.ZERO
var DMG = 10

func _physics_process(delta: float) -> void:

	match state:
		"Movement":
			
			var velocity_now := velocity
			move_and_slide()
			if get_slide_collision_count() > 0:
				var collider = get_last_slide_collision()
				if not snapped(collider.get_normal().x,0.01) == 0:
					velocity = velocity_now.bounce(collider.get_normal())
					
			if not is_on_floor():
				velocity += get_gravity() * delta

			# Handle jump.
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = SMALL_JUMP_VELOCITY
				
			if Input.is_action_pressed("left") and is_on_floor(): 
				velocity.x = -SPEED
			elif Input.is_action_pressed("right") and is_on_floor(): 
				velocity.x = SPEED
			elif is_on_floor(): velocity.x = 0
			elif Input.is_action_pressed("left") and not is_on_floor(): 
				velocity.x += -SPEED * delta
			elif Input.is_action_pressed("right") and not is_on_floor(): 
				velocity.x += SPEED *delta
			if Input.is_action_just_pressed("aim") and is_on_floor(): 
				state = "Jumping"
				starting_mouse_pos = get_global_mouse_position()
			if velocity.x == 0 and velocity.y == 0: 
				$AnimationPlayer.play("slime_idle")
			if velocity.x > 0: $Icon.flip_h = false
			elif velocity.x < 0: $Icon.flip_h = true
			if velocity.x != 0 and is_on_floor(): $AnimationPlayer.play("moving_linear")
			if not is_on_floor():
				$Icon.flip_h = false
				$AnimationPlayer.stop()
				var angle = snapped(velocity.angle(), PI / 4)
				var index = wrapi(roundi(angle / (PI / 4)), 0, 8)
				var index_to_frame = {0:1,1:5,2:0,3:4,4:3,5:6,6:2,7:7,8:1}
				$Icon.frame = index_to_frame[index]
			$Camera2D.enabled = true
		"Jumping":
			mouse_pos = get_global_mouse_position()
			mouse_vector = mouse_pos - starting_mouse_pos
			if Input.is_action_just_released("aim"): 
				mouse_vector = mouse_vector.normalized()
				mouse_distance = starting_mouse_pos.distance_to(mouse_pos)
				if mouse_distance >= 20: mouse_distance = 20
				velocity.y = mouse_vector.y * mouse_distance * JUMP_VELOCITY
				velocity.x = mouse_vector.x * mouse_distance * JUMP_VELOCITY
				if encounter: state = "Encounter"
				else: state = "Movement" 
		"Encounter":
			$Camera2D.enabled = false
			var velocity_now := velocity
			move_and_slide()
			if get_slide_collision_count() > 0:
				var collider = get_last_slide_collision()
				velocity = velocity_now.bounce(collider.get_normal())
			if Input.is_action_just_pressed("aim"): 
				state = "Jumping"
				starting_mouse_pos = get_global_mouse_position()
			if not is_on_floor():
				$Icon.flip_h = false
				$AnimationPlayer.stop()
				var angle = snapped(velocity.angle(), PI / 4)
				var index = wrapi(roundi(angle / (PI / 4)), 0, 8)
				var index_to_frame = {0:1,1:5,2:0,3:4,4:3,5:6,6:2,7:7,8:1}
				$Icon.frame = index_to_frame[index]
			if Input.is_action_just_pressed("aim"): 
				state = "Jumping"
				starting_mouse_pos = get_global_mouse_position()
				
				
				
				
