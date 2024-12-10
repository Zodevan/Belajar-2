extends Node
@onready var coin_label: Label = $coin_label
var score = 0

func add_coin():
	score += 1
	coin_label.text = "kamu mendapatkan " + str(score) + " coins" 
	print (score)
