extends CanvasLayer


signal transitioned_in()
signal transitioned_out()

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var margin_container: MarginContainer = $MarginContainer


func transition_in() -> void:
	animation_player.play("in")


func transition_out() -> void:
	create_tween().tween_property(margin_container, "scale", Vector2.ZERO, 0.3)
	animation_player.play("out")


func transition_to(scene: String) -> void:
	transition_in()
	await transitioned_in

	var new_scene = load(scene).instantiate()
	var root: Window = get_tree().get_root()

	root.get_child(root.get_child_count() - 1).free()
	root.add_child(new_scene)

	new_scene.load_scene()
	await new_scene.loaded

	transition_out()
	await transitioned_out

	new_scene.activate()


func _on_animation_player_animation_finished(anim_name: String) -> void:
	if anim_name == "in":
		animation_player.play("pulse_text")
		transitioned_in.emit()
	elif anim_name == "out":
		transitioned_out.emit()


