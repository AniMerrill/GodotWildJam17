extends Node
#To do
#	- Edit audio files for smoother transitions
#

onready var mdm = $MixingDeskMusic

var current_song = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	#inititialise all the songs
#	mdm.init_song("Exploration")
#	#start with explore
#	mdm.play("Exploration")
#	current_song = "Exploration"
	
	#electronic theme
	mdm.init_song("LevelTheme")
	mdm.start_alone("LevelTheme", 8)
	mdm.toggle_mute("LevelTheme", 7)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#buttons for debug

#guard appears
func _on_Button_pressed():
#	mdm.queue_bar_transition("GuardOnWatch")
#	current_song = "GuardOnWatch"
#	print("queue guard")
	mdm.toggle_fade("LevelTheme", 9)

#Game over 
#use queue_sequence() to loop smth once, then proceed to next song
func _on_Button2_pressed():
#	mdm.queue_sequence(["GameOver", "Exploration"], "beat", "loop")
#	current_song = "Exploration"
#	print("queue game over")
	_fadein_above_layer("LevelTheme", 6, 0)
	
	_fadeout_below_layer("LevelTheme", 9, 11)

#Back to main loop
func _on_Button3_pressed():
#	mdm.queue_bar_transition("Exploration")
#	current_song = "Exploration"
#	print("queue exploration")
	_fadein_below_layer("LevelTheme", 9, 11) 
	
	_fadeout_above_layer("LevelTheme", 6, 0)

func _fadein_range(song:String, track:int, last_track:int):
	for i in range(track, last_track + 1):
		mdm.fade_in(song, i)

func _fadeout_range(song:String, track:int, last_track:int):
	for i in range(track, last_track + 1):
		mdm.fade_out(song, i)
		
#custom functions
#fade in above track up until last_track
func _fadein_above_layer(song:String, track:int, last_track:int):
	for i in range(last_track, track + 1):
		mdm.fade_in(song, i)
		print(i)
		
#fade out above track up until last_track
func _fadeout_above_layer(song:String, track:int, last_track:int):
	for i in range(last_track, track + 1):
		mdm.fade_out(song, i)
		print(i)
#fade in below track up until last_track
func _fadein_below_layer(song:String, track:int, last_track:int):
	for i in range(track, last_track + 1):
		mdm.fade_in(song, i)
		print(i)
#fade out below track up until last_track
func _fadeout_below_layer(song:String, track:int, last_track:int):
	for i in range(track, last_track + 1):
		mdm.fade_out(song, i)
		print(i)
