extends CharacterBody2D
var time = 0
var direction = 1
var enemySpeed = 300
func _ready():
	var ray:RayCast2D = $RayCast2D
	var enemySpeed = 300
	
func _process(delta):
	var ray:RayCast2D = $RayCast2D
	var player:CharacterBody2D = %Slime
	var body:AnimatedSprite2D = $AnimatedSprite2D
	while ray.collide_with_bodies == false:
		time += delta 
		if time > randf_range(3.0,5.0):
			var waiting = 0
			time = 0
			direction *= -1
			if body.flip_h == true:
				body.flip_h = false
			else:
				body.flip_h = true
			while waiting < randf_range(2.0,3.5):
				waiting += delta
		position.x = direction*enemySpeed*delta
	var targetPosition = player.global_position.x
	while position.x != targetPosition:
		if targetPosition > position:
			direction = 1
		else:
			direction = -1
		position.x = direction*enemySpeed*delta
	
	
	
