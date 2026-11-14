extends Area2D

func _ready() -> void:
	var player:CharacterBody2D = %Slime

func _on_body_entered(body: Node2D) -> void:
	var player:CharacterBody2D = %Slime
	player.position = Vector2(old_x,old_y)
