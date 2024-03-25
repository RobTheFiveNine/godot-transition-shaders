extends Node3D


signal loaded()

@export_file("*.tscn") var next_scene: String


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("switch_scene"):
		SceneManager.transition_to(next_scene)


func activate() -> void:
	pass


func load_scene() -> void:
	await get_tree().create_timer(3.0).timeout
	loaded.emit()
