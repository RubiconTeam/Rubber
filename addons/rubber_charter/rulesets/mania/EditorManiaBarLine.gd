extends Node
class_name EditorManiaBarLine

var chart:IndividualChart
@export var note_size:Vector2 = Vector2(48,48)
@export var note_container:Control
@export var bar_line_label:Label
var lanes:int = 4:
	set(value):
		lanes = value
		note_container.custom_minimum_size.x = note_size.x * value

func _load_notes_from_chart(new_chart:IndividualChart):
	chart = new_chart
	bar_line_label.text = new_chart.Name
	lanes = new_chart.Lanes
