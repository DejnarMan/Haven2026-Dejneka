extends Node2D
const SKELETON_1 =preload("res://encounter_1.tscn")
var dictionary_of_skel_en :Dictionary = {1:SKELETON_1}
var dictionary_of_creatures := {"Skeleton":dictionary_of_skel_en}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func create_encounter(Enemy_type,number_of_encounter):
#	var creature_encounter = dictionary_of_creatures[Enemy_type]
#	var encounter = create_encounter[Enemy_type]
	pass
	
