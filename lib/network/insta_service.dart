import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insta_post/insta_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';


class InstaService {
  String? name;
  String? authCode;
  String? accessToken;
  bool? hasCode;

  void getAuth(String url) {
    //Convert auth code to string
    authCode = url.replaceAll(redirectUri + '?code=', '').replaceAll('#_', '');
  }

  Future getToken() async {
    var url = Uri.parse("https://api.instagram.com/oauth/access_token");

    final response = await http.post(url, body: {
      'client_id': appId,
      'client_secret': appKey,
      'grant_type': 'authorization_code',
      'redirect_uri': redirectUri,
      'code': authCode
    });
    // final Map<String,dynamic> result = jsonDecode(response.body);
    accessToken =
        InstaPostModel.fromJson(jsonDecode(response.body)).accessToken;

    return accessToken;
  }

  void saveTokenToDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', accessToken!);
  }


  Future<List<Post>> getUserPosts() async {
    var url = Uri.parse(
        'https://graph.instagram.com/me/media?fields=id,username,timestamp,caption,media_url&access_token=$accessToken');

    final response = await http.get(url);
    Map<String,dynamic> data = jsonDecode(response.body);
    List<Post> postsList
    =  Posts.formJson(data).postList!.toList();

    return postsList;
  }
}
