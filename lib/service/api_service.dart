import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tiktok_downloader2/model/tiktok_model2.dart';

class ApiService {
  static const String _baseUrl = "https://api.tikfetch.xyz/api/video/download";
  static const String _apiKey =
      "tk_FMfTllGYGNbahHnJSWqqYqlzgoSeaBdKyTKxfvFdOIjkARMhIeecmiotYplYFPOy"; // 🔑 put your key here
  // static const String videoUrl = "https://vt.tiktok.com/ZSD6PeJju/"; // 🔑 put your key here

  static Future<TiktokModel?> fetchVideo(String videoUrl) async {
    try {
      final uri = Uri.parse("$_baseUrl?url=${Uri.encodeComponent(videoUrl)}");

      final response = await http.get(
        uri,
        headers: {
          "x-api-key": _apiKey,
          "Accept": "*/*",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return TiktokModel.fromJson(data);
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
