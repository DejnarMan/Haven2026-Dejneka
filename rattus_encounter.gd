extends TileMapLayer
var DMG = 10
var timer :float
var player :CharacterBody2D
var is_first = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$AnimationPlayer.play()
	$AnimationPlayer.speed_scale = 0.1
	player = get_tree().get_first_node_in_group("slime")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer > 3 and is_first: 
		player.HP -= DMG
		timer = 0
	elif timer > 1 and not is_first:
		player.HP -= DMG
		timer = 0
		


func _on_win_zone_body_entered(body: Node2D) -> void:
	body.global_position = body.TP_pos
	body.encounter = false
	body.state = "Movement"
	$Camera2D.enabled = false
	body.get_node("Camera2D").enabled = true
	queue_free()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.HP -= DMG
		body.velocity = Vector2.ZERO
		body.global_position = $Marker2D.global_position
