class_name FileResource extends Node
## Handles saving and loading and game progressions.

#region Parameters
const SAVE_PATH: String = "user://save.tres"
const SETTINGS_PATH: String = "user://settings.tres"

## A resource for updating user-preferred settings
var settings : Settings

## A resource for game story/timeline progession
var progress : Progress

## Reference to the GameManager
var _gm

## Emmited in ready after settings have been loaded.
signal settings_loaded

## Emmited when a game save has been loaded.
signal save_loaded

## Emmited when the game is saved
signal game_saved

## Emmited when the settings are saved
signal settings_saved
#endregion

func _ready() -> void:
	if settings_exist():
		settings = ResourceLoader.load(SETTINGS_PATH)
	else:
		settings = Settings.new()
		save_settings()
	settings_loaded.emit()
	if save_exists():
		load_game()
	else:
		print("Save didnt exist")
		if OS.is_debug_build():
			progress = load("uid://d1mpepah1fwti")
			return
		new_game()

func save_exists() -> bool:
	return ResourceLoader.exists(SAVE_PATH)

func settings_exist() -> bool:
	return ResourceLoader.exists(SETTINGS_PATH)

func new_game():
	if progress:
		progress.new_game() # Might end up removing this. I originally thought I would handle this entirely here, but maybe I can use it for clean up logic
	print("Starting new game with new progress resource")
	progress = Progress.new()

func save_game() -> void:
	# TODO add visual representation of save completed
	if not _gm:
		#_gm = Utils.find_game_manager()
		print("No game manager. Game not saved.")
		return
	if not _gm.current_level_loaded:
		return
	_gm.current_level_loaded._progress._save_progress()
	var result = ResourceSaver.save(progress, SAVE_PATH)
	print("Game Saved")
	assert(result == OK)
	game_saved.emit()
	
func load_game() -> void:
	if OS.is_debug_build():
		progress = load("uid://d1mpepah1fwti")
		save_loaded.emit()
		return
	progress = ResourceLoader.load(SAVE_PATH, "Progress")
	save_loaded.emit()

func save_settings() -> void:
	var result = ResourceSaver.save(settings, SETTINGS_PATH)
	assert(result == OK)
	settings_saved.emit()
