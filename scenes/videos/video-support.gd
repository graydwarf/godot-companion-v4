extends Node

var _listOfVideos : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func FindVideoById(id):
	for video in _listOfVideos:
		if video._id == id:
			return video

func FindVideoByVideoId(videoId):
	for video in _listOfVideos:
		if video._videoId == videoId:
			return video
