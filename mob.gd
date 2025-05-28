extends CharacterBody2D

var health = 2
var score = 0

@onready var player = get_node("/root/Game/Player")
@onready var score_display = get_node("/root/Game/CanvasLayer/Score")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200.0
	move_and_slide()

func take_damage():
	%Slime.play_hurt()
	health -= 1
	if health <= 0:
		queue_free()
		if score_display and score_display.has_method("add_score"):
			score_display.add_score(1)
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
