extends Node

@onready var start: Marker2D = $Start
const ANIMAL = preload("uid://hry4tlce2bq2")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)
	spawn_animal()

func spawn_animal():
	var animal: Animal = ANIMAL.instantiate()
	animal.position = start.position
	call_deferred("add_child", animal)
