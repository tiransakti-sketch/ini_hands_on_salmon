extends Control

@onready var label = $text
@onready var timer = $Timer
@onready var name_label = $nama

var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

var typing_time: float

signal finished_displaying()

func display_text(text_to_display: String, speaker: String = ""):
	name_label.text = speaker
	name_label.visible = speaker != ""
	#print("display_text: " + text_to_display)
	label.text = text_to_display
	label.visible_characters = 0
	
	typing_time = 0
	while label.visible_characters < label.get_total_character_count():
		typing_time += get_process_delta_time()
		label.visible_characters = 30 * typing_time as int
		await get_tree().process_frame
	finished_displaying.emit()
