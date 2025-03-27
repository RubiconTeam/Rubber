@tool
extends Control
class_name ChartEditor

@export var rulesets:Dictionary[String,PackedScene]
@export var meta:SongMeta:
	set(value):
		meta = value
		#_change_song()

@export var cur_difficulty_index:int = 0:
	set(value):
		if meta.Difficulties.size() < value and value >= 0:
			cur_difficulty_index = value

var ruleset_instance:Node

func _ready() -> void:
	_change_difficulty()

func _change_difficulty():
	_setup_ruleset()

func _setup_ruleset() -> void:
	if meta == null:
		printerr("[Rubber] Metadata is null")
		return
	
	var ruleset = meta.Difficulties[cur_difficulty_index].RuleSet
	if meta.Difficulties[cur_difficulty_index].RuleSet == null or ruleset.is_empty() or !ruleset in rulesets.keys():
		if ruleset != meta.DefaultRuleset:
			ruleset = meta.DefaultRuleset
			printerr("[Rubber] No editor found for the difficulty's ruleset. Falling back to "+ruleset)
			_setup_ruleset()
		else:
			printerr("[Rubber] No editor found for the default ruleset. Returning")
			return
	
	ruleset_instance = rulesets[meta.DefaultRuleset].instantiate()
	add_child(ruleset_instance)
	ruleset_instance.name = ruleset
	
	var charts:Array[IndividualChart]
	for chart:IndividualChart in meta.Difficulties[cur_difficulty_index].Chart.Charts:
		charts.append(chart)
	ruleset_instance._setup_bar_lines(charts)
