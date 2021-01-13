extends Control

var button_play
var button_exit
var button_start_debug
var label_select_debug
var label

func _ready():
	button_play = $Play
	button_exit = $Exit
	button_start_debug = $DEBUG/START
	label_select_debug = $DEBUG/LEVEL
	label = $Label
	
	button_play.connect("pressed", self, "start_game")
	button_exit.connect("pressed", self, "exit_game")
	button_start_debug.connect("pressed", self, "set_level_and_play")
	
	g_GameConfig.load_levels()
	label_select_debug.text = g_GameConfig.levels[g_GameConfig.level]
	
	var a = {"test": "tset"}.hash()

func start_game():
	get_tree().change_scene("res://scenes/Main.tscn")

func exit_game():
	get_tree().quit(0)

func set_level_and_play():
	var level = label_select_debug.text
	self.start_game()
