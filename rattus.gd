extends Node2D
var player: CharacterBody2D
var knowing
const SPEED :float = 200
@onready var root : Node2D = get_tree().current_scene
var encounter_number
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	encounter_number = randi() % 1 + 1
	player = get_tree().get_first_node_in_group("slime")
	$AnimationPlayer.speed_scale = 0.2
	$AnimationPlayer.play("Rattus_fly")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if knowing:
		global_position = global_position.move_toward(player.global_position,delta*SPEED)


func _on_teleport_body_entered(body) -> void:
	if body == player: 
		player.encounter = true
		player.velocity = Vector2.ZERO
		root.create_encounter("Rattus",encounter_number)
		queue_free()

func _on_see_body_entered(body: Node2D) -> void:
	if body == player:
		knowing = true
