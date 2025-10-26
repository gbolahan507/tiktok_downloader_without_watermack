import 'package:flutter/material.dart';
import 'package:tiktok_downloader2/model/tiktok_model2.dart';
import 'package:tiktok_downloader2/service/api_service.dart';
import 'package:tiktok_downloader2/service/download_service.dart';

class VideoProvider with ChangeNotifier {
  TiktokModel? _video;
  bool _loading = false;
  bool _downloading = false;
  String? _errorMessage;

  TiktokModel? get video => _video;
  bool get loading => _loading;
  bool get downloading => _downloading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVideo(String videoUrl) async {
    if (videoUrl.isEmpty) {
      _errorMessage = "Please enter a valid URL";
      notifyListeners();
      return;
    }

    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await ApiService.fetchVideo(videoUrl);
      _video = result;

      if (_video == null || _video!.url == null) {
        _errorMessage = "Failed to fetch video. Please check the URL and try again.";
      }
    } catch (e) {
      _errorMessage = "An error occurred: $e";
      _video = null;
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> downloadVideo() async {
    if (_video == null || _video!.url == null || _video!.videoId == null) {
      _errorMessage = "No video available to download";
      notifyListeners();
      return;
    }

    _downloading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await DownloadService.saveNetworkImage(_video!.url!, _video!.videoId!);
    } catch (e) {
      _errorMessage = "Download failed: $e";
    }

    _downloading = false;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void clearVideo() {
    _video = null;
    notifyListeners();
  }
}
