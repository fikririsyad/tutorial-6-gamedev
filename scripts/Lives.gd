extends Label


func _process():
	self.text = "Lives : " + str(Global.lives)
