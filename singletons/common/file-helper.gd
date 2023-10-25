extends Node

# Other lines will be moved down.
# Not recommended for large change counts since
# it opens and closes the file for every line change
func AddLineToText(filePath, lineToAdd, insertAtLineNumber):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var index = -1
	var modifiedContent = ""
	while not file.eof_reached():
		index += 1
		if index == insertAtLineNumber:
			# Don't increment line
			modifiedContent += file.get_line() + "\n"
			modifiedContent += lineToAdd + "\n"
			continue
			
		modifiedContent += file.get_line() + "\n"
	file.close()
	WriteToFileAsText(filePath, modifiedContent)
	
func FindLineNumberOfText(filePath, searchForValue, startIndex):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var index = -1
	while not file.eof_reached():
		index += 1
		if index < startIndex:
			file.get_line()
			continue
			
		var line = file.get_line()
		if line.begins_with(searchForValue):
			return index
	file.close()
	
func RemoveLinesInFile(filePath, startIndex, endIndex):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var lineIndex = -1
	var modifiedContent = ""
	while not file.eof_reached():
		lineIndex += 1
		if lineIndex >= startIndex && lineIndex <= endIndex:
			# Need to iterate the loop
			file.get_line()
			continue

		modifiedContent += file.get_line() + "\r"
	file.close()
	WriteToFileAsText(filePath, modifiedContent)
	
func GetFileAsText(filePath):
	if FileAccess.file_exists(filePath):
		var file = FileAccess.open(filePath, FileAccess.READ)
		return file.get_as_text()

func WriteToFileAsText(filePath, content):
	var file = FileAccess.open(filePath, FileAccess.WRITE)
	file.store_string(content)
	file.close()

func ReplaceLineInFile(filePath, searchForValue, replaceWithValue):
	var modifiedContent = ""
	var file = FileAccess.open(filePath, FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		if line == searchForValue:
			line = replaceWithValue

		modifiedContent += line + "\r\n"
	file.close()
	WriteToFileAsText(filePath, modifiedContent)
	
func LoadJsonFromFile(filePath):
	if FileAccess.file_exists(filePath):
		var file = FileAccess.open(filePath, FileAccess.READ)
		var fileText = file.get_as_text()
		file.close()
		var test_json_conv = JSON.new()
		test_json_conv.parse(fileText)
		return test_json_conv.get_data()
	return {}
	
func SaveJsonToDisk(saveData, savePath):
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	if file != 0:
		print("Error opening: " + savePath + " - ErrorCode: " + str(file))
		return
		
	file.store_string(JSON.stringify(saveData))
	file.close()

func SaveJsonToDiskAsChunks(saveData, savePath):
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	var buffer_size = 65536 # 64KB buffer size
	if file.get_error() != OK:
		print("Error opening: " + savePath + " - ErrorCode: " + str(file.get_error()))
		return

	var json_string = JSON.stringify(saveData)
	var json_length = json_string.length()
	var chunk_size = min(buffer_size, json_length)

	var start_index = 0
	while start_index < json_length:
		file.store_string(json_string.substr(start_index, chunk_size))
		start_index += chunk_size

	file.close()
	
func CreateDirectory(savePath):
	if !DirAccess.dir_exists_absolute(savePath):
		DirAccess.make_dir_recursive_absolute(savePath)
		
func GetFilesFromPath(path):
	var files = []
	var dir = DirAccess.open(path)
	dir.list_dir_begin() # TODOGODOT4 fill missing arguments https://github.com/godotengine/godot/pull/40547

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

# TODO: Use at own risk. Comment if not needed.
#func DeleteAllFilesAndFolders(path):
#	var files = GetFilesFromPath(path)
#	#var dir = Directory.new()
#	for file in files:
#		#var result = dir.remove(file)
#		var result = OS.move_to_trash(path + "\\" + file) 
#		if result != 0:
#			OS.alert("Failed to delete file (" + file + ") in: " + path)
#			return result
#	return 0

