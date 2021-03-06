extends Control

func _ready(): #Actualise la configuration à l'accès
	if OS.window_fullscreen:
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_ON"
		$FullscreenLabel/FullscreenButton.pressed = true
	else:
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_OFF"
	if Global.fps_counter:
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_ON"
		$ShowFPSLabel/ShowFPSButton.pressed = true
	else:
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_OFF"
	if Global.rumble:
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_ON"
	else:
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_OFF"
		$RumbleLabel/RumbleButton.pressed = false
	if Global.autoretry:
		$AutoretryLabel/AutoretryButton.text = "SETTINGS_VALUE_ON"
	else:
		$AutoretryLabel/AutoretryButton.text = "SETTINGS_VALUE_OFF"
		$AutoretryLabel/AutoretryButton.pressed = false
	if get_node("/root/CRT/ColorRect").visible:
		$CRTLabel/CRTButton.text = "SETTINGS_VALUE_ON"
	else:
		$CRTLabel/CRTButton.text = "SETTINGS_VALUE_OFF"
		$CRTLabel/CRTButton.pressed = false

func _on_FullscreenButton2_toggled(button_pressed): #Plein écran
	if button_pressed:
		OS.window_fullscreen = true
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_ON"
	else:
		OS.window_fullscreen = false
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_OFF"

func _on_ShowFPSButton_toggled(button_pressed): #Afficher FPS
	if button_pressed:
		Global.fps_counter = true
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.fps_counter = false
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_OFF"

func _on_RumbleButton_toggled(button_pressed): #Vibrations
	if button_pressed:
		Global.rumble = true
		Input.start_joy_vibration(0,1,1,1) #Fait vibrer la manette au moment ou l'option est activée
		Input.vibrate_handheld() #Et le téléphone
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.rumble = false
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_OFF"

func _on_AutoretryButton_toggled(button_pressed):
	if button_pressed:
		Global.autoretry = true
		$AutoretryLabel/AutoretryButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.autoretry = false
		$AutoretryLabel/AutoretryButton.text = "SETTINGS_VALUE_OFF"

func _on_CRTButton_toggled(button_pressed):
	if button_pressed:
		get_node("/root/CRT/ColorRect").visible = true
		$CRTLabel/CRTButton.text = "SETTINGS_VALUE_ON"
	else:
		get_node("/root/CRT/ColorRect").visible = false
		$CRTLabel/CRTButton.text = "SETTINGS_VALUE_OFF"

func _on_YoutubeButton_pressed():
	OS.shell_open("https://www.youtube.com/channel/UC-HSiGn2AxScpDLhY6mLdMw")

func _on_GithubButton_pressed():
	OS.shell_open("https://github.com/Daymortel")
