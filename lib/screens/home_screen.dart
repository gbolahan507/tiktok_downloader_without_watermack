import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_downloader2/providers/video_provider.dart';
import 'package:tiktok_downloader2/screens/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _getVideo() async {
    if (_controller.text.isEmpty) return;

    final videoProvider = context.read<VideoProvider>();
    await videoProvider.fetchVideo(_controller.text);

    if (videoProvider.video != null && videoProvider.video!.url != null) {
      // Navigate to preview
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const VideoApp(),
          ),
        );
      }
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
            Consumer<VideoProvider>(
              builder: (context, videoProvider, child) {
                if (videoProvider.loading) {
                  return const CircularProgressIndicator();
                }
                if (videoProvider.errorMessage != null) {
                  return Text(
                    videoProvider.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
