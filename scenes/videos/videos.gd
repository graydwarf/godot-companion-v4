extends HBoxContainer

@onready var _tagsGridContainer = $HSplitContainer/TagSearchContainer/TagsColumnContainer/ScrollContainer/TagsGridContainer
@onready var _tagsScrollContainer = $HSplitContainer/TagSearchContainer/TagsColumnContainer/ScrollContainer
@onready var _tagNode = load("res://scenes/videos/tagnode.tscn")
@onready var _disclaimerScreen = $HSplitContainer/VSplitContainer/VideoTitleContainer/DisclaimerScreen
@onready var _videoCountLabel = $HSplitContainer/TagSearchContainer/VideoInfoContainer/HBoxContainer/VBoxContainer/VideoCountLabel
@onready var _videoRowGridContainer = $HSplitContainer/VSplitContainer/VideoTitleContainer/ScrollContainer/VideoRowGridContainer
@onready var _videoRowScrollContainer = $HSplitContainer/VSplitContainer/VideoTitleContainer/ScrollContainer
@onready var _videoRowScene = preload("res://scenes/videos/video-row/video-row.tscn")

var _videoDataPath = "res://assets/video-data/godot-companion-v02-export.json"
var _youTubeIcon = preload("res://assets/icons/youtube-24x16.png")
var _displayedVideos : Array
var _tagsList : Array
var _searchTerm = ""
var _selectedTagIndex
var _listOfVideos : Array

func _ready() -> void:
	LoadSignals()
	LoadVideoDataIntoMemory()
	GetTagsFromVideos()
	UpdateVideoCountLabel()
	RefreshTagsGrid()

func UpdateVideoCountLabel():
	_videoCountLabel.text = str(_listOfVideos.size())

func LoadVideoDataIntoMemory():
	if !FileAccess.file_exists(_videoDataPath):
		return
	
	var jsonText = FileAccess.get_file_as_string(_videoDataPath)
	var jsonDict = JSON.parse_string(jsonText)
	
	for id in jsonDict.Videos.keys():
		var video_data = jsonDict.Videos[id]
		var video_node = Video.new()
		video_node._id = id
		video_node._title = video_data.get("Title", "")
		video_node._videoId = video_data.get("VideoId", "")
		video_node._serviceId = video_data.get("ServiceId", "")
		video_node._godotVersion = video_data.get("GodotVersion", "")
		video_node._dimensions = video_data.get("Dimensions", "")
		video_node._codeType = video_data.get("CodeType", "")
		var tags_array : Array = []
		for tag in video_data.get("Tags", {}).keys():
			if video_data.Tags[tag]:
				tags_array.append(tag)
		video_node._tags = tags_array
		_listOfVideos.append(video_node)

func GetVideoIdsFromDict(dict):
	var delimitedListOfVideoIds = ""
	for video in dict:
		delimitedListOfVideoIds += video
		delimitedListOfVideoIds += ","
	delimitedListOfVideoIds = delimitedListOfVideoIds.rstrip(",")
	return delimitedListOfVideoIds

func GetTagsFromVideos():
	_tagsList.clear()
	for video in _listOfVideos:
		for tag in video._tags:
			if _tagsList.find(tag) == -1:
				_tagsList.append(tag)
	_tagsList.sort()

func ClearVideoRowGridContainer():
	for videoRow in _videoRowGridContainer.get_children():
		_videoRowGridContainer.remove_child(videoRow)
		
func LoadSignals():
	Signals.connect("LaunchVideo", LaunchVideo)
	Signals.connect("SearchTextChanged", SearchTextChanged)
	Signals.connect("TagClicked", TagClicked)

func TagClicked(tagNode):
	LoadVideoList(tagNode.text)

func SearchTextChanged(searchTerm):
	ResetScrollPosition()
	ShowVideoScreen()
	_searchTerm = searchTerm
	RefreshTagsGrid()

func ResetScrollPosition():
	_tagsScrollContainer.scroll_vertical = 0

func RefreshTagsGrid():
	for tagNode in _tagsGridContainer.get_children():
		_tagsGridContainer.remove_child(tagNode)

	var tagNode

	for tag in _tagsList:
		if _searchTerm == "" or tag.rfindn(_searchTerm) >= 0:
			tagNode = CreateNewTagNode(tag)
			_tagsGridContainer.add_child(tagNode);

func CreateNewTagNode(tagName):
	var tagNode = _tagNode.instantiate()
	tagNode.SetText(tagName)
	return tagNode

func AutoSelectFirstVideo():
	if _tagsGridContainer.get_child_count() < 1:
		return

	var tagNode = _tagsGridContainer.get_child(0)
	LoadVideoList(tagNode.text)

func ShowVideoScreen():
	_disclaimerScreen.visible = false
	_videoRowScrollContainer.visible = true

func LoadVideoList(tagName : String):
	ClearVideoRowGridContainer()
	ShowVideoScreen()
	_displayedVideos.clear()

	var index = 0
	for video in _listOfVideos:
		for tag in video._tags:
			if tag == tagName:
				_displayedVideos.append(video)
				var videoRow = _videoRowScene.instantiate()
				_videoRowGridContainer.add_child(videoRow)
				videoRow.ConfigureVideoRow(index, video._title, video._godotVersion, video._dimensions, video._codeType)
				index += 1
				break

func GetIconForVideo(video):
	var serviceId = video._serviceId
	if serviceId == "YouTube":
		return _youTubeIcon

# Navigates to youtube
func LaunchVideo(index):
	var video = _displayedVideos[index]
	var videoId = video._videoId
	var uri = "https://www.youtube.com/watch?v=" + videoId
	Common.NavigateToUri(uri)

func LoadVideosForSelectedTag():
	#var tag = _tagColumn.get_item_text(_selectedTagIndex)
	pass

func _on_DisclaimerLinkButton_pressed() -> void:
	_videoRowScrollContainer.visible = false
	_disclaimerScreen.visible = true
