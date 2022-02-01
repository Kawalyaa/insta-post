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
  void initState() {
    super.initState();
    InstaService().getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
    InstaService instaService = InstaService();
    List<Posts> allPosts = [];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insta Post'),
        ),
        body: SafeArea(
          child: FutureBuilder<dynamic>(
            future: instaService.getUserPosts(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
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

              // List<Posts>? myPosts = instaService.postsList;
              //print(instaService.postsList[0].username);
              return allPosts.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => PostCard(
                            mediaType: snapshot.data![index].mediaType,
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
