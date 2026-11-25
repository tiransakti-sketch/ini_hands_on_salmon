extends Node

signal dialogue_ended  # Add this signal at the top

@onready var textbox_scene = preload("res://scene/textbox.tscn")
var dialog_lines: Array = []
var current_lines_index = 0
var text_box
var is_dialog_active = false
var can_advance_lines = false


func start_dialog(position: Vector2, lines: Array):
	if is_dialog_active:
		end_dialog()
		await get_tree().process_frame
	
	dialog_lines = lines
	current_lines_index = 0
	is_dialog_active = true
	can_advance_lines = false
	
	text_box = textbox_scene.instantiate()
	text_box.finished_displaying.connect(_on_textbox_finished_displaying)
	get_tree().root.call_deferred("add_child", text_box)
	
	if position != Vector2.ZERO:
		text_box.position = position
	
	while text_box != null and not text_box.is_inside_tree():
		await get_tree().process_frame
	if text_box != null:
		await _show_current_line()

func _show_current_line():
	var line: Dictionary = dialog_lines[current_lines_index]
	await text_box.display_text(line.get("text", ""), line.get("name", ""))

func _input(event):
	if event.is_action_pressed("next") and is_dialog_active:
		if can_advance_lines:
			current_lines_index += 1
			
			if current_lines_index < dialog_lines.size():
				can_advance_lines = false
				if text_box != null:
					_show_current_line()
			else:
				end_dialog()


func _on_textbox_finished_displaying():
	can_advance_lines = true

func end_dialog():
	is_dialog_active = false
	can_advance_lines = false
	current_lines_index = 0
	
	if text_box:
		text_box.queue_free()
		text_box = null
	
	dialogue_ended.emit()  # Emit the signal when dialogue ends
