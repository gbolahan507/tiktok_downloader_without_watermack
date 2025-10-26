import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_downloader2/providers/video_provider.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoProvider = context.read<VideoProvider>();
    final videoUrl = videoProvider.video?.url;

    if (videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..initialize().then((_) {
          if (mounted) {
            setState(() {});
          }
        });
    }
  }

  Future<void> _downloadVideo() async {
    final videoProvider = context.read<VideoProvider>();
    await videoProvider.downloadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Video Preview"),
          actions: [
            Consumer<VideoProvider>(
              builder: (context, videoProvider, child) {
                return IconButton(
                  icon: videoProvider.downloading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.download),
                  onPressed: videoProvider.downloading ? null : _downloadVideo,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const CircularProgressIndicator(),
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
