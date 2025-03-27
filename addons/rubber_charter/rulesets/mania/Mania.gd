@tool
extends Control

@export var bar_line_container:HBoxContainer
@export var bar_line_template:PackedScene

func _setup_bar_lines(charts:Array[IndividualChart]):
	for chart:IndividualChart in charts:
		var bar_line:EditorManiaBarLine = bar_line_template.instantiate()
		bar_line.name = chart.Name
		bar_line._load_notes_from_chart(chart)
		add_child(bar_line)
