class TiktokModel {
  bool? success;
  String? videoId;
  String? url;

  TiktokModel({
    this.success,
    this.videoId,
    this.url,
  });

  TiktokModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    videoId = json['videoId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['videoId'] = videoId;
    data['url'] = url;
    return data;
  }
}
