extends Control
var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("slime")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(player)
#	$HBoxContainer/hp_text.text = str(player.HP)+"/"+str(100)
