import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

class DownloadService {
  static Future<String?> downloadVideo(String url, String videoId) async {
    try {
      // Ask permission (Android only)
      if (Platform.isAndroid) {
        var status = await Permission.storage.request();
        if (!status.isGranted) {
          return null;
        }
      }

      // Get save path
      Directory dir = await getApplicationDocumentsDirectory();
      String savePath = "${dir.path}/tiktok_$videoId.mp4";

      Dio dio = Dio();

      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print(
                "Download progress: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );
      print(savePath);

      return savePath;
    } catch (e) {
      print("Download error: $e");
      return null;
    }
  }

  static Future<void> saveNetworkImage(String url, String videoId) async {
    var tempDir = await getTemporaryDirectory();
    String videoPath = "${tempDir.path}/$videoId/sample_video.mp4";

    await Dio().download(url, videoPath);

    final result = await SaverGallery.saveFile(
      filePath: videoPath,
      skipIfExists: true,
      fileName: videoId,
      androidRelativePath: "Movies",
    );

    print(result);
  }
}
