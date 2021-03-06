extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

var motion = Vector2()

func _physics_process(_delta):
	
	motion.y += GRAVITY

	if Input.is_action_pressed("move_right"):
		motion.x = SPEED
		$Sprite.play("Walk") # ANIMAÇÃO ANDANDO
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		motion.x = -SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")	
	motion = move_and_slide(motion, UP)

func _on_Meteor_body_entered(_body):
	$".".queue_free()

