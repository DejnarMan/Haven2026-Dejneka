extends CharacterBody2D
var time = 0
var direction = 1
var enemySpeed = 5000
@onready var parent:= get_parent()
@onready var ray:RayCast2D = $RayCast2D
var player:CharacterBody2D
@onready var body:Sprite2D = $Sprite2D
@onready var root:Node2D = get_tree().current_scene

var rnd = RandomNumberGenerator
var encounter_number = 0
var HP = 20
var DMG = 20
func _ready():
	player = get_tree().get_first_node_in_group("slime")
	encounter_number = randi() % 4 + 1
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
	

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body == player: 
		player.encounter = true
		player.velocity = Vector2.ZERO
		root.create_encounter("Skeleton",encounter_number)
		queue_free()

	
