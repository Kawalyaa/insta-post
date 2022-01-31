class InstaPostModel {
  int id;
  String accessToken;
  String userName;

  // String profilePic;

  InstaPostModel(this.id, this.accessToken, this.userName);

  InstaPostModel.fromJson(Map<String, dynamic> json)
      : id = json["user_id"] ?? 0,
        accessToken = json["access_token"] ?? '',
        userName = json["username"] ?? '';
}

class Posts {
  int id;
  String mediaType;
  String caption;
  String username;
  String timestamp;

  Posts(this.id, this.mediaType, this.caption, this.timestamp, this.username);

  Posts.formJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        mediaType = json['media_type'] ?? '',
        caption = json['caption'] ?? '',
        timestamp = json['timestamp'] ?? '',
        username = json['username'] ?? '';
}
