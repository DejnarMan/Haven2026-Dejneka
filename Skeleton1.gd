extends CharacterBody2D
var time = 0
var direction = 1
var enemySpeed = 5000
@onready var ray:RayCast2D = $RayCast2D
@onready var player:CharacterBody2D = $"../Slime"
@onready var body:Sprite2D = $Sprite2D
func _ready():
	pass
func _process(delta):
	if ray.collide_with_bodies == false:
		time += delta 
		if time > randf_range(3.0,5.0):
			time = 0
			direction *= -1
			if body.flip_h == true:
				body.flip_h = false
			else:
				body.flip_h = true
		position.x = direction*enemySpeed*delta
	var targetPosition = player.global_position.x
	if position.x != targetPosition:
		if targetPosition > position.x:
			direction = 1
			body.flip_h = true
		else:
			direction = -1
			body.flip_h = false
		velocity.x = direction*enemySpeed*delta
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	
