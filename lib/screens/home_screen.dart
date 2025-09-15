import 'package:flutter/material.dart';
import 'package:tiktok_downloader2/model/tiktok_model2.dart';
import 'package:tiktok_downloader2/screens/video_screen.dart';
import 'package:tiktok_downloader2/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  TiktokModel? video;
  bool _loading = false;

  Future<void> _getVideo() async {
    if (_controller.text.isEmpty) return;

    setState(() => _loading = true);

    final result = await ApiService.fetchVideo(_controller.text);

    setState(() {
      video = result;
      _loading = false;
    });

    if (video != null && video!.url != null) {
      // 👇 Navigate to preview
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoApp(url: video!.url!, videoId: video!.videoId!),
        ),
      );
    } else {
      print("Failed to fetch video");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TikTok Downloader")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter TikTok URL",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getVideo,
              child: const Text("Fetch Video"),
            ),
            const SizedBox(height: 20),
            if (_loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
