extends Control



var _total_cups: int = 0
var _current_cups: int = 0
var _attempts: int = -1



@onready var vb_complete: VBoxContainer = $VbComplete
@onready var music: AudioStreamPlayer = $Music
@onready var attempts_label: Label = $MC/VB/HbAttempts/AttemptsLabel

const MAIN = preload("res://Scenes/Main/main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	_total_cups = get_tree().get_nodes_in_group(Cup.GROUP_NAME).size()
	_current_cups = _total_cups
	SignalHub.on_cup_destroyed.connect(cup_destroyed)
	SignalHub.on_attempt_made.connect(on_attempt_made)
	on_attempt_made()

func on_attempt_made():
	_attempts += 1
	attempts_label.text = "%03d" % _attempts



func cup_destroyed():
	_current_cups -= 1
	if _current_cups == 0:
		music.play()
		vb_complete.show()
		get_tree().paused = true

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(MAIN)
