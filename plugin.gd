@tool
class_name SaveAndLoadPlugin extends EditorPlugin

const FILE_UID = "uid://lkfpqb461clk"
const PLUGIN_NAME = "save_and_load_system"
const AUTOLOAD_NAME = "File"

func _enable_plugin() -> void:
	add_autoload_singleton(AUTOLOAD_NAME , ResourceUID.uid_to_path(FILE_UID))


func _disable_plugin() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
