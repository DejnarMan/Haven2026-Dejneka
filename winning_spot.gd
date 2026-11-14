extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player:CharacterBody2D = %Slime
	var point:CollisionShape2D = $CollisionShape2D
	


# Called every frame. 'delta' is the 
	


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	
