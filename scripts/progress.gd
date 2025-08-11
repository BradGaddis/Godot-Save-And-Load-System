class_name Progress extends Resource
## The game progression resource save in the [File] resource

#region Properties
## The equivalent "all levels" [br] 
## Should always be in the forms {"level name" : "UID"}
@export var available_levels: Dictionary[String, String]:
	set(val):
		_level_assertion_proper(val[val.keys()[0]])
		available_levels = val
	get:
		for key in available_levels.keys():
			_level_assertion_proper(available_levels[key])
		return available_levels

@export var all_levels_progressions: Dictionary[String, Dictionary]
	
## The secrets progression resource
@export var secrets = load("../secrets.gd")

## The levels that have been completed
@export var levels_complete: Array[String]

## The current characgter playing
var current_character

## An array that stores all levels that can be played
var all_levels: Array[String]

## An array that stores all levels that are available to be played
#@export var available_levels_by_path: Array[String]

## The level the game will always start at. In particular on clicking "New Game"
@export var single_entry_level: String 

var current_level: String: 
		set(val):
			current_level = (_level_assertion_proper(val))
		get:
			return current_level
 
@export_group("Player Stats")

## The player's current health
@export var current_health: float

## The player's max health
@export var max_health: float
#endregion

func _init() -> void:
	if secrets:
		secrets = secrets.new()

func _level_assertion_proper(value: String) -> String:
	assert(value.to_lower().begins_with("uid"), value + " should be a UID ")
	return value

func new_game():
	pass

func get_available_levels() -> Dictionary[String, String]:
	return available_levels
	
