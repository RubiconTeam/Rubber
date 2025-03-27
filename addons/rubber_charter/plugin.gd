@tool
extends EditorPlugin

var addon_path:String = get_script().get_path().get_base_dir()+"/"
var editor_instance = load(addon_path+"scenes/Editor.tscn").instantiate()

func _enter_tree() -> void:
	if !Engine.is_editor_hint():
		return
	
	EditorInterface.get_editor_main_screen().add_child(editor_instance)

func _exit_tree() -> void:
	editor_instance.queue_free()
	queue_free()

func _has_main_screen() -> bool:
	return true

func _get_plugin_icon() -> Texture2D:
	return null

func _get_plugin_name() -> String:
	return "Rubber"
