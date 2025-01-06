extends Node3D

signal OnTextBegin
signal OnTextEnd

@export
var DiaPassages: Array[String]
var index: int = 0

var CurrentText: String = ""
var CurrentCharIdx: int = 0

func _ready() -> void:
	$CurrentText.text = ""
	$Timer.timeout.connect(_write_char)

func object_interacted() -> void:
	print("Text triggered via interaction")
	begin_text()

func begin_text():
	OnTextBegin.emit()
	_write_char()
	$Timer.start()
	
func continue_text():
	$Timer.stop()
	index += 1
	if index < DiaPassages.size():
		begin_text()
	else:
		end_text()
	
func end_text():s
	$CurrentText.text = ""
	OnTextEnd.emit()

func _write_char():
	print(DiaPassages[index][CurrentCharIdx])
	CurrentText += DiaPassages[index][CurrentCharIdx]
	print (CurrentText)
	$CurrentText.text = CurrentText
	CurrentCharIdx += 1
	
	if (CurrentCharIdx == DiaPassages[index].length()):
		print("go")
		$Timer.stop()
