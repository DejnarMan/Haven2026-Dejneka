extends TileMapLayer
var DMG = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_win_zone_body_entered(body: Node2D) -> void:
	body.global_position = body.TP_pos
	body.encounter = false
	body.state = "Movement"
	$Camera2D.enabled = false
	body.get_node("Camera2D").enabled = true
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.HP -= DMG
		body.velocity = Vector2.ZERO
		body.global_position = $Marker2D.global_position
	print(body == CharacterBody2D)
