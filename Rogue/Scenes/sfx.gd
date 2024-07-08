extends Node

var volume_db = GameManager.sfx_volume_db
	
func coin():
	$Coin.volume_db = volume_db
	$Coin.play()


func death():
	$Death.volume_db = volume_db
	$Death.play()


func hit():
	$Hit.volume_db = volume_db
	$Hit.play()


func heart():
	$Heart.volume_db = volume_db
	$Heart.play()


func key():
	$Key.volume_db = volume_db
	$Key.play()


func walk():
	$Walk.volume_db = volume_db - 10.0
	$Walk.play()


func next():
	$Next.volume_db = volume_db - 10.0
	$Next.play()

