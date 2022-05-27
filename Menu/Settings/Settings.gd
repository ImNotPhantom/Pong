extends Control

func _on_MultiOn_pressed():
	Global.isMultiplayer = true
	$MultiplayerLabel/Marker.rect_position = Vector2(42.5, 135)
	$BotLevelLabel.visible = false
	$BotLevelLabel/Marker.visible = false
	$BotLevelLabel/Easy.disabled = true
	$BotLevelLabel/Med.disabled = true
	$BotLevelLabel/Hard.disabled = true

func _on_MultiOff_pressed():
	Global.isMultiplayer = false
	$MultiplayerLabel/Marker.rect_position = Vector2(198.5, 135)
	$BotLevelLabel.visible = true
	$BotLevelLabel/Marker.visible = true
	$BotLevelLabel/Easy.disabled = false
	$BotLevelLabel/Med.disabled = false
	$BotLevelLabel/Hard.disabled = false

func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Level.tscn")

func _on_Easy_pressed():
	Global.diff = "easy"
	$BotLevelLabel/Marker.rect_position = Vector2(-8, 135)

func _on_Med_pressed():
	Global.diff = "med"
	$BotLevelLabel/Marker.rect_position = Vector2(126, 135)

func _on_Hard_pressed():
	Global.diff = "hard"
	$BotLevelLabel/Marker.rect_position = Vector2(259, 135)
