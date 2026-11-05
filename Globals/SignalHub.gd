extends Node

signal on_animal_died
signal on_cup_destroyed
signal on_attempt_made

func emit_on_animal_died():
	on_animal_died.emit()

func emit_on_cup_destroyed():
	print("signal emitted")
	on_cup_destroyed.emit()

func emit_on_attempt_made():
	on_attempt_made.emit()
