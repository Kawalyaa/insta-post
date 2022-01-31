import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insta_post/insta_post_model.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const String urlAuth = 'https://api.instagram.com/oauth/authorize';
const String appId = '645134416738143';
const String appKey = '138986e104f2403f3cd951d0412f46f8';
const String redirectUri = 'https://github.com/Kawalyaa';
const String responseType = 'code';
const scope = 'user_profile,user_media';
String authUrl = urlAuth +
    '?client_id=' +
    appId +
    '&redirect_uri=' +
    redirectUri +
    '&scope=' +
    scope +
    'response_type=' +
    responseType;

String uri =
    "https://api.instagram.com/oauth/authorize?client_id=645134416738143&redirect_uri=https://github.com/Kawalyaa&scope=user_profile,user_media&response_type=code";

class InstaService {
  String? authCode;
  String? accessToken;
  bool? hasCode;
  List<Posts> postsList = [];

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
    print("$accessToken mmmmmmmmmmmmmmmmm");

    return accessToken;
  }

  Future<List<Posts>> getUserPosts() async {
    var url = Uri.parse(
        'https://graph.instagram.com/me/media?fields=id,username,timestamp,caption,media_type,&access_token=$accessToken');

    final response = await http.get(url);

    postsList = Posts.formJson(jsonDecode(response.body)) as List<Posts>;
    return postsList;
  }
}