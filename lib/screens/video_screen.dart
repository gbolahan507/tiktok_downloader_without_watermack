import 'package:flutter/material.dart';
import 'package:tiktok_downloader2/service/download_service.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  final String url;
  final String videoId;

  const VideoApp({super.key, required this.url, required this.videoId});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool _downloading = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future<void> _downloadVideo() async {
    setState(() => _downloading = true);

    await DownloadService.saveNetworkImage(widget.url, widget.videoId);

    setState(() => _downloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Video Preview"),
          actions: [
            IconButton(
              icon: _downloading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Icon(Icons.download),
              onPressed: _downloading ? null : _downloadVideo,
            ),
          ],
        ),
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
