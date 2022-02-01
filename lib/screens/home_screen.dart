import 'package:flutter/material.dart';
import 'package:insta_post/network/insta_service.dart';

import '../insta_post_model.dart';
import '../posts_card.dart';

class HomeScreen extends StatefulWidget {
  final String? token;
  final List<Posts>? postsList;

  const HomeScreen({this.token, this.postsList, Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    InstaService().getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    InstaService instaService = InstaService();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insta Post'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(
            itemCount: instaService.postsList.length,
            itemBuilder: (context, index) => PostCard(
                mediaType: instaService.postsList[index].mediaType,
                username: instaService.postsList[index].username,
                caption: instaService.postsList[index].caption,
                timestamp: instaService.postsList[index].timestamp),
          ),
        )));
  }
}
