extends KinematicBody2D

export var speed = 250
var ball
var start = false

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(_delta):
	if Global.isMultiplayer:
		var velocity = Vector2.ZERO
		speed = 400
		if Input.is_action_pressed("ui_up"):
			velocity.y -= speed
		if Input.is_action_pressed("ui_down"):
			velocity.y += speed
		move_and_slide(velocity)
	else:
		if Global.diff == "easy":
			speed = 250
			move_and_slide(Vector2(0,get_opponent_direction()) * speed)
		elif Global.diff == "med":
			speed = 375
			move_and_slide(Vector2(0,get_opponent_direction()) * speed)
		elif Global.diff == "hard":
			speed = 500
			move_and_slide(Vector2(0,get_opponent_direction()) * speed)

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
