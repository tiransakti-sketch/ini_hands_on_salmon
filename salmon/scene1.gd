extends Node2D

const d1: Array = [
	{"name": "Andini", "text": "Akhirnya... setelah sekian lama..."},
	{"name": "Andini", "text": "setelah semua darah, keringat, dan air mata itu"}
]

const d2: Array = [
	{"name": "Andini", "text": "dia akhirnya akan..."},
]

const d3: Array = [
	{"name": "Andini", "text": "menjadi milikku♡"}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogManager.start_dialog(Vector2.ZERO, d1)
	await DialogManager.dialogue_ended
	$think.visible = true
	$mc1.visible = false
	DialogManager.start_dialog(Vector2.ZERO, d2)
	await DialogManager.dialogue_ended
	$think.visible = false
	$happy.visible = true
	DialogManager.start_dialog(Vector2.ZERO, d3)
	await DialogManager.dialogue_ended

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
