import 'package:flutter/material.dart';
import 'package:insta_post/network/insta_service.dart';

import '../insta_post_model.dart';
import '../insta_post_theme.dart';
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
  Widget build(BuildContext context) {
    InstaService instaService = InstaService();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insta Post'),
        ),
        body: SafeArea(
          child: FutureBuilder<List<Posts>>(
            future: instaService.getUserPosts(),
            builder: (context, AsyncSnapshot<List<Posts>> snapshot) {
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ];
              }
              List<Posts> myPosts = instaService.postsList;
              print(myPosts[0].username);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.builder(
                  itemCount: instaService.postsList.length,
                  itemBuilder: (context, index) => PostCard(
                      mediaType: instaService.postsList[index].mediaType,
                      username: instaService.postsList[index].username,
                      caption: instaService.postsList[index].caption,
                      timestamp: instaService.postsList[index].timestamp),
                ),
              );
            },
          ),
        ));
  }
}
