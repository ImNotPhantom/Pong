extends KinematicBody2D

export var speed = 400
var start = false

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	move_and_slide(velocity)
