class_name Settings extends Resource
## The settings resource to save to disk

## Whether or not flight y-controls are inverted
@export var inverted_flight_control: bool
## Whether or not camera on-foot y-controls are inverted
@export var inverted_camera: bool
## How sensitive the mouse controls are
@export var mouse_sensitivity: float
## THe volume level
@export var volume: float
## How quickly the camera will move
@export var camera_sensitivity: float
## The default typing speed. Can be overwritting on a per-resource basis
@export var default_typing_speed: float = 20

## Sets up default values to member properties
func _init() -> void:
	inverted_flight_control = true
	mouse_sensitivity = .5
	inverted_camera = true
	volume = 1
	camera_sensitivity = 50
