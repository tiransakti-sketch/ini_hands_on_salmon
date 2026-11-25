extends Node2D

const after: Array = [
	{"name": "Anne", "text": "This outfit is perfect!"},
	{"name": "entahlah", "text": "hiiii"}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogManager.start_dialog(Vector2.ZERO, after)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
