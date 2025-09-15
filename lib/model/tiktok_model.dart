// class TiktokModel {
//   bool? success;
//   String? videoId;
//   String? url;
//   Metadata? metadata;

//   TiktokModel({this.success, this.videoId, this.url, this.metadata});

//   TiktokModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     videoId = json['videoId'];
//     url = json['url'];
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['videoId'] = this.videoId;
//     data['url'] = this.url;
//     if (this.metadata != null) {
//       data['metadata'] = this.metadata!.toJson();
//     }
//     return data;
//   }
// }

// class Metadata {
//   String? id;
//   String? description;
//   String? createTime;
//   String? coverUrl;
//   int? duration;
//   bool? isPrivate;
//   Author? author;
//   Stats? stats;
//   Music? music;
//   List<Subtitles>? subtitles;
//   String? locationCreated;
//   List<String>? suggestedWords;
//   bool? textTranslatable;
//   bool? isAd;
//   int? downloadsRemaining;
//   bool? isMetered;

//   Metadata(
//       {this.id,
//       this.description,
//       this.createTime,
//       this.coverUrl,
//       this.duration,
//       this.isPrivate,
//       this.author,
//       this.stats,
//       this.music,
//       this.subtitles,
//       this.locationCreated,
//       this.suggestedWords,
//       this.textTranslatable,
//       this.isAd,
//       this.downloadsRemaining,
//       this.isMetered});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     description = json['description'];
//     createTime = json['createTime'];
//     coverUrl = json['coverUrl'];
//     duration = json['duration'];
//     isPrivate = json['isPrivate'];
//     author =
//         json['author'] != null ? new Author.fromJson(json['author']) : null;
//     stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
//     music = json['music'] != null ? new Music.fromJson(json['music']) : null;
//     if (json['subtitles'] != null) {
//       subtitles = <Subtitles>[];
//       json['subtitles'].forEach((v) {
//         subtitles!.add(new Subtitles.fromJson(v));
//       });
//     }
//     locationCreated = json['locationCreated'];
//     suggestedWords = json['suggestedWords'].cast<String>();
//     textTranslatable = json['textTranslatable'];
//     isAd = json['isAd'];
//     downloadsRemaining = json['downloadsRemaining'];
//     isMetered = json['isMetered'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['description'] = this.description;
//     data['createTime'] = this.createTime;
//     data['coverUrl'] = this.coverUrl;
//     data['duration'] = this.duration;
//     data['isPrivate'] = this.isPrivate;
//     if (this.author != null) {
//       data['author'] = this.author!.toJson();
//     }
//     if (this.stats != null) {
//       data['stats'] = this.stats!.toJson();
//     }
//     if (this.music != null) {
//       data['music'] = this.music!.toJson();
//     }
//     if (this.subtitles != null) {
//       data['subtitles'] = this.subtitles!.map((v) => v.toJson()).toList();
//     }
//     data['locationCreated'] = this.locationCreated;
//     data['suggestedWords'] = this.suggestedWords;
//     data['textTranslatable'] = this.textTranslatable;
//     data['isAd'] = this.isAd;
//     data['downloadsRemaining'] = this.downloadsRemaining;
//     data['isMetered'] = this.isMetered;
//     return data;
//   }
// }

// class Author {
//   String? id;
//   String? username;
//   String? name;
//   bool? verified;
//   String? avatar;
//   Stats? stats;

//   Author(
//       {this.id,
//       this.username,
//       this.name,
//       this.verified,
//       this.avatar,
//       this.stats});

//   Author.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     name = json['name'];
//     verified = json['verified'];
//     avatar = json['avatar'];
//     stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['name'] = this.name;
//     data['verified'] = this.verified;
//     data['avatar'] = this.avatar;
//     if (this.stats != null) {
//       data['stats'] = this.stats!.toJson();
//     }
//     return data;
//   }
// }

// class Stats {
//   int? followerCount;
//   int? followingCount;
//   int? heart;
//   int? heartCount;
//   int? videoCount;
//   int? diggCount;
//   int? friendCount;

//   Stats(
//       {this.followerCount,
//       this.followingCount,
//       this.heart,
//       this.heartCount,
//       this.videoCount,
//       this.diggCount,
//       this.friendCount});

//   Stats.fromJson(Map<String, dynamic> json) {
//     followerCount = json['followerCount'];
//     followingCount = json['followingCount'];
//     heart = json['heart'];
//     heartCount = json['heartCount'];
//     videoCount = json['videoCount'];
//     diggCount = json['diggCount'];
//     friendCount = json['friendCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['followerCount'] = this.followerCount;
//     data['followingCount'] = this.followingCount;
//     data['heart'] = this.heart;
//     data['heartCount'] = this.heartCount;
//     data['videoCount'] = this.videoCount;
//     data['diggCount'] = this.diggCount;
//     data['friendCount'] = this.friendCount;
//     return data;
//   }
// }

// class Stats {
//   int? likes;
//   int? shares;
//   int? comments;
//   int? views;

//   Stats({this.likes, this.shares, this.comments, this.views});

//   Stats.fromJson(Map<String, dynamic> json) {
//     likes = json['likes'];
//     shares = json['shares'];
//     comments = json['comments'];
//     views = json['views'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['likes'] = this.likes;
//     data['shares'] = this.shares;
//     data['comments'] = this.comments;
//     data['views'] = this.views;
//     return data;
//   }
// }

// class Music {
//   String? id;
//   String? title;
//   String? playUrl;
//   String? coverLarge;
//   String? coverMedium;
//   String? coverThumb;
//   String? authorName;
//   bool? original;
//   bool? private;
//   int? duration;
//   PreciseDuration? preciseDuration;
//   bool? isCopyrighted;

//   Music(
//       {this.id,
//       this.title,
//       this.playUrl,
//       this.coverLarge,
//       this.coverMedium,
//       this.coverThumb,
//       this.authorName,
//       this.original,
//       this.private,
//       this.duration,
//       this.preciseDuration,
//       this.isCopyrighted});

//   Music.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     playUrl = json['playUrl'];
//     coverLarge = json['coverLarge'];
//     coverMedium = json['coverMedium'];
//     coverThumb = json['coverThumb'];
//     authorName = json['authorName'];
//     original = json['original'];
//     private = json['private'];
//     duration = json['duration'];
//     preciseDuration = json['preciseDuration'] != null
//         ? new PreciseDuration.fromJson(json['preciseDuration'])
//         : null;
//     isCopyrighted = json['isCopyrighted'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['playUrl'] = this.playUrl;
//     data['coverLarge'] = this.coverLarge;
//     data['coverMedium'] = this.coverMedium;
//     data['coverThumb'] = this.coverThumb;
//     data['authorName'] = this.authorName;
//     data['original'] = this.original;
//     data['private'] = this.private;
//     data['duration'] = this.duration;
//     if (this.preciseDuration != null) {
//       data['preciseDuration'] = this.preciseDuration!.toJson();
//     }
//     data['isCopyrighted'] = this.isCopyrighted;
//     return data;
//   }
// }

// class PreciseDuration {
//   double? preciseDuration;
//   double? preciseShootDuration;
//   double? preciseAuditionDuration;
//   double? preciseVideoDuration;

//   PreciseDuration(
//       {this.preciseDuration,
//       this.preciseShootDuration,
//       this.preciseAuditionDuration,
//       this.preciseVideoDuration});

//   PreciseDuration.fromJson(Map<String, dynamic> json) {
//     preciseDuration = json['preciseDuration'];
//     preciseShootDuration = json['preciseShootDuration'];
//     preciseAuditionDuration = json['preciseAuditionDuration'];
//     preciseVideoDuration = json['preciseVideoDuration'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['preciseDuration'] = this.preciseDuration;
//     data['preciseShootDuration'] = this.preciseShootDuration;
//     data['preciseAuditionDuration'] = this.preciseAuditionDuration;
//     data['preciseVideoDuration'] = this.preciseVideoDuration;
//     return data;
//   }
// }

// class Subtitles {
//   String? languageId;
//   String? languageCode;
//   String? url;
//   String? format;
//   String? version;
//   String? source;
//   String? urlExpire;
//   String? size;
//   String? text;

//   Subtitles(
//       {this.languageId,
//       this.languageCode,
//       this.url,
//       this.format,
//       this.version,
//       this.source,
//       this.urlExpire,
//       this.size,
//       this.text});

//   Subtitles.fromJson(Map<String, dynamic> json) {
//     languageId = json['languageId'];
//     languageCode = json['languageCode'];
//     url = json['url'];
//     format = json['format'];
//     version = json['version'];
//     source = json['source'];
//     urlExpire = json['urlExpire'];
//     size = json['size'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['languageId'] = this.languageId;
//     data['languageCode'] = this.languageCode;
//     data['url'] = this.url;
//     data['format'] = this.format;
//     data['version'] = this.version;
//     data['source'] = this.source;
//     data['urlExpire'] = this.urlExpire;
//     data['size'] = this.size;
//     data['text'] = this.text;
//     return data;
//   }
// }
