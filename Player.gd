extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

var motion = Vector2()

func _physics_process(_delta):
	var speed = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		motion.x = SPEED
		$Sprite.play("walk") # ANIMAÇÃO ANDANDO
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		motion.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle") # ANIMAÇÃO PARADO
	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			motion.y = JUMP_HEIGHT
