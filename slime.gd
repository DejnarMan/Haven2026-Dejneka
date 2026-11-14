extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var state :String= "Movement"
var mouse_pos: Vector2= Vector2.ZERO
var starting_mouse_pos: Vector2 = Vector2.ZERO
var mouse_vector: Vector2 = Vector2.ZERO
var mouse_distance: float= 0
func _physics_process(delta: float) -> void:
	match state:
		"Movement":
			if not is_on_floor():
				velocity += get_gravity() * delta
			
			# Handle jump.
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				
			if Input.is_action_pressed("left") and is_on_floor(): 
				velocity.x = -SPEED
			elif Input.is_action_pressed("right") and is_on_floor(): 
				velocity.x = SPEED
			elif is_on_floor(): velocity.x = 0
			move_and_slide()
			if Input.is_action_just_pressed("aim"): 
				state = "Jumping"
				starting_mouse_pos = get_global_mouse_position()
		"Jumping":
			mouse_pos = get_global_mouse_position()
			mouse_vector = mouse_pos - starting_mouse_pos
			if Input.is_action_just_released("aim"): 
				state = "Movement"
				mouse_vector = mouse_vector.normalized()
				mouse_distance = starting_mouse_pos.distance_to(mouse_pos)
				if mouse_distance >= 20: mouse_distance = 20
				velocity = mouse_vector * mouse_distance * JUMP_VELOCITY
				
				
				
				
				
				
