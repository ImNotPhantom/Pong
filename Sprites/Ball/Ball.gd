extends KinematicBody2D

export var ballSpeed = 400
var velocity = Vector2.ZERO
var start = false

func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * ballSpeed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)

func stop_ball():
	ballSpeed = 0

func restart_ball():
	randomize()
	ballSpeed = 400
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
