extends Label

var current_score = 0

func _ready():
	#initialize the label text when the game starts
	update_display()

func add_score(points):
	current_score += points
	update_display()

func update_display():
	text = "Score: " + str(current_score)
