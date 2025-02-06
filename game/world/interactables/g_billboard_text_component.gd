extends Node3D

signal OnTextBegin
signal OnTextEnd

#array of g_billboard_passages 
@export var DiaPassages: Resource
var index: int = -1

var CurrentText: String = ""
var CurrentCharIdx: int = 0

var line_finished = false

func _ready() -> void:
	$CurrentText.text = ""
	$Timer.timeout.connect(_write_char)

func object_interacted() -> void:
	print("Text triggered via interaction")
	continue_text()

func begin_text():
	OnTextBegin.emit()
	_write_char()
	$Timer.start()
	
func continue_text():
	line_finished = false
	CurrentText = ""
	$Timer.stop()
	index += 1
	CurrentCharIdx = 0
	if index < DiaPassages.Passages.size():
		begin_text()
	else:		end_text()
	
func end_text():
	$CurrentText.text = ""
	OnTextEnd.emit()

func _write_char():
	CurrentText += DiaPassages.Passages[index][CurrentCharIdx]
	$CurrentText.text = CurrentText
	CurrentCharIdx += 1
	
	if (CurrentCharIdx == DiaPassages.Passages[index].length()):
		$Timer.stop()
		line_finished = true
		if line_finished:
			print("line finished")
