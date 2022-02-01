class InstaPostModel {
  int id;
  String accessToken;
  String userName;

  InstaPostModel(this.id, this.accessToken, this.userName);

  InstaPostModel.fromJson(Map<String, dynamic> json)
      : id = json["user_id"] ?? 0,
        accessToken = json["access_token"] ?? '',
        userName = json["username"] ?? '';
}

List<Posts> postsList1(Map<String, dynamic> json) =>
    List<Posts>.from(json["data"].map((dt) => Posts.formJson(dt)));

class Posts {
  String id;
  String mediaType;
  String caption;
  String username;
  String timestamp;

  Posts(this.id, this.mediaType, this.caption, this.timestamp, this.username);

  Posts.formJson(Map json)
      : id = json['id'] ?? '',
        mediaType = json['media_type'] ?? '',
        caption = json['caption'] ?? '',
        timestamp = json['timestamp'] ?? '',
        username = json['username'] ?? '';
}
