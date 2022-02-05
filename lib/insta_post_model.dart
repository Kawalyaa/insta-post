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


class Posts {
 List<Post> ?postList;

  Posts({this.postList});

 factory Posts.formJson(Map<String,dynamic> json){
    var list = json["data"]as List;
    List<Post> getList = list.map((post) => Post.formJson(post)).toList();
    return Posts(postList: getList);
  }

}



class Post {
  String ?id;
  String? mediaType;
  String ?caption;
  String? username;
  String ?timestamp;

  Post({this.id, this.mediaType, this.caption, this.timestamp, this.username});

  factory Post.formJson(Map<String,dynamic> json){
    return Post(id: json['id'] ?? '',
        mediaType: json['media_type'] ?? '',
        caption: json['caption'] ?? '',
        timestamp: json['timestamp'] ?? '',
        username: json['username'] ?? '');
  }
}

