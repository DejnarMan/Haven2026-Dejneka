extends Node2D
const SKELETON_1  =preload("res://encounter_1.tscn")
const SKELETON_2  =preload("res://encounter_2.tscn")
const SKELETON_3  =preload("res://encounter_3.tscn")
const SKELETON_4  =preload("res://encounter_4.tscn")
const SKELETON_5  =preload("res://encounter_5.tscn")
const RATTUS_1 =preload("res://rattus_encounter_1.tscn")
const RATTUS_2 =preload("res://rattus_encounter_2.tscn")
var dictionary_of_skel_en :Dictionary = {1:SKELETON_1,2:SKELETON_2,3:SKELETON_3,4:SKELETON_4,5:SKELETON_5}
var dictionary_of_ratt_en :Dictionary = {1:RATTUS_1,2:RATTUS_2}
var dictionary_of_creatures := {"Skeleton":dictionary_of_skel_en,"Rattus":dictionary_of_ratt_en}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
func create_encounter(Enemy_type,number_of_encounter):	
	print(Enemy_type,number_of_encounter)
	var creature_type_encounter = dictionary_of_creatures[Enemy_type]
	print(creature_type_encounter,)
	var encounter = creature_type_encounter[number_of_encounter].instantiate()
	%Slime.TP_pos = %Slime.global_position
	encounter.get_node("Camera2D").enabled = true
	encounter.global_position.x = 1000
	encounter.global_position.y = 1000
	%Slime.global_position = encounter.get_node("Marker2D").global_position
	%Slime.velocity = Vector2.ZERO
	%Slime.get_node("Icon").frame = 8
	%Slime.encounter = true
	%Slime.state = "Encounter"
	add_child(encounter)
