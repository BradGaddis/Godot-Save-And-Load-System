@tool
class_name SaveAndLoadPlugin extends EditorPlugin

const FILE_UID = "uid://lkfpqb461clk"
const PLUGIN_NAME = "save-and-load-system"

func _enable_plugin() -> void:
	# Add autoloads here.
	add_autoload_singleton("File" , ResourceUID.uid_to_path(FILE_UID))


func _disable_plugin() -> void:
	# Remove autoloads here.
	remove_autoload_singleton("File")


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
