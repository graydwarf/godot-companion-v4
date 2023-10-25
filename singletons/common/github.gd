extends Node

# Reminder: Invalid hash will delete downloaded file
func DownloadFileFromGitHub(localFilePath, gitHubUrl, httpRequest : HTTPRequest):
	httpRequest.download_file = localFilePath
	var __ignore = httpRequest.request(gitHubUrl)
