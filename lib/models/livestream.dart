import 'dart:convert';

class LiveStream {
  final String title;
  final String image;
  final String uid;
  final String username;
  final startAt;
  final int viewers;
  final String channelID;
  LiveStream({
    required this.title,
    required this.image,
    required this.uid,
    required this.username,
    required this.viewers,
    required this.channelID,
    required this.startAt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'image': image});
    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'viewers': viewers});
    result.addAll({'channelID': channelID});
    result.addAll({'startAt': startAt});

    return result;
  }

  factory LiveStream.fromMap(Map<String, dynamic> map) {
    return LiveStream(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      viewers: map['viewers']?.toInt() ?? 0,
      channelID: map['channelID'] ?? '',
      startAt: map['startAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveStream.fromJson(String source) =>
      LiveStream.fromMap(json.decode(source));
}
