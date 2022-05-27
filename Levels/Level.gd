extends Node

var playerScore = 0
var opponentScore = 0

func _on_WallLeft_body_entered(body):
	goal("left")

func _on_WallRight_body_entered(body):
	goal("right")

func _process(delta):
	$PlayerScore.text = str(playerScore - 1)
	$OpponentScore.text = str(opponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", 'restart_ball')
	$CountdownLabel.visible = false

func goal(dir):
	if dir == "left":
		opponentScore += 1
	else:
		playerScore += 1
	if opponentScore >= 10:
		$Win.visible = true
		$CountdownLabel.visible = false
		$Win.text = "Player 2 Wins!"
		get_tree().call_group("BallGroup", 'stop_ball')
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://Menu/Main/MainMenu.tscn")
	elif playerScore >= 10:
		$Win.visible = true
		$Win.text = "Player 1 Wins!"
		get_tree().call_group("BallGroup", 'stop_ball')
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://Menu/Main/MainMenu.tscn")
		
	$Ball.position = Vector2(640,360)
	$CountdownLabel.visible = true
	get_tree().call_group("BallGroup", 'stop_ball')
	$"CountdownTimer".start()
