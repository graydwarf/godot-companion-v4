extends Node

func Rand(low, high):
	return round(randf_range(low, high))
	
func UriSafetyCheck(uri : String):
	var listOfSafeUrls = ["https://www.youtube.com", "https://github.com", "https://discord.gg", "https://godotengine.org", "https://docs.godotengine.org", "https://godotshaders.com", "https://www.patreon.com/poplava", "https:/ko-fi.com/poplava", "https://poplava.itch.io/godot-companion", "https://poplava.itch.io"]
	for safeUrl in listOfSafeUrls:
		if uri.begins_with(safeUrl):
			return true
	# Not a safe url for some reason
	return false

func NavigateToUri(uri):
	if !UriSafetyCheck(uri):
		return

	var _a = OS.shell_open(uri)

func CreateFolderStructureForNewExample(rootPath, navPath):
	var examplePath = rootPath
	var folders = navPath.split("/", false)
	var dir = DirAccess.open(examplePath)
	
	if dir == null:
		DirAccess.make_dir_recursive_absolute(examplePath)

	for folder in folders:
		examplePath += "/" + folder
		if !dir.dir_exists(examplePath):
			DirAccess.make_dir_recursive_absolute(examplePath)

	return examplePath

func ValidateLocalFileHash(path, expectedHashValue):
	var chunkSize = 1024
	var ctx = HashingContext.new()

	# Start a SHA-256 context.
	ctx.start(HashingContext.HASH_MD5)

	# Check that file exists.
	if not FileAccess.file_exists(path):
		return

	# Open the file to hash.
	var file = FileAccess.open(path, FileAccess.READ)

	# This solution was provided by a user in Discord (@Nisovin)
	# because the example in help produces random values. Nisovin
	# thinks the issue was due to reading the eof wrong.
	var remain = file.get_length()
	while not file.eof_reached() and remain > 0:
		var b = file.get_buffer(chunkSize if remain > chunkSize else remain)
		ctx.update(b)
		remain -= chunkSize

	# Get the computed hash.
	var res = ctx.finish()
	var hashValue = res.hex_encode()
	#print(hashValue)
	# Compare expected vs actual
	# Runs through here twice. First time
	# is checking local vs firebase.
	# if second time, checking downloaded from github
	# vs firebase. I think.
	if Game._isDebugging:
		return true

	if expectedHashValue == hashValue:
		return true
	else:
		return false

func ValidateLocalFileExists(localFilePath):
	var isFileFound = false
	if FileAccess.file_exists(localFilePath):
		isFileFound = true
	else:
		isFileFound = false
	return isFileFound

func RemoveUserFile(filePath : String):
	if !filePath.begins_with("user://"):
		return

	if filePath.ends_with(".gd") || filePath.ends_with(".pck") || filePath.ends_with(".gc"):
		DirAccess.remove_absolute(filePath)
