extends Node2D

const map_1 = preload("res://map_part_1.tscn")
const map_2 = preload("res://map_part_2.tscn")
const map_3 = preload("res://map_part_3.tscn")
const map_4 = preload("res://map_part_4.tscn")
var lenght = 950
var a 

func MapGenerate() -> void:
	#for i in range(3):
	a = randi_range(0,3)
	match a:
		0:
			var map = map_1.instantiate()
			map.position.x = global_position.x + lenght
			add_child(map)
			lenght += 950 
		1:
			var map = map_2.instantiate()
			map.position.x = global_position.x + lenght
			add_child(map)
			lenght += 950 
		2:
			var map = map_3.instantiate()
			map.position.x = global_position.x + lenght
			add_child(map)
			lenght += 950
		3:
			var map = map_4.instantiate()
			map.position.x = global_position.x + lenght
			add_child(map)
			lenght += 950 
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MapGenerate()
	MapGenerate()
	MapGenerate()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
