import 'package:flutter/material.dart';
import 'package:insta_post/insta_post_theme.dart';
import 'package:insta_post/network/insta_service.dart';

import '../insta_post_model.dart';
import '../posts_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Post>? postList;


  const HomeScreen({ this.postList,Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
          child:ListView.builder(
            itemCount: widget.postList?.length,
            itemBuilder: (context, index) =>  PostCard(
                mediaUrl: widget.postList![index].mediaUrl,
                username: widget.postList![index].username,
                caption: widget.postList![index].caption,
                timestamp:widget.postList![index].timestamp),
          ),
        )));
  }
}


// FutureBuilder<List<Post>>(
// future: instaService.getUserPosts(),
// builder: (context, snapshot) {
// if (snapshot.data==null) {
// return Center(child: Text('Error has Occurred....',style: InstaPostTheme.lightTextTheme.headline4,),);
//
// }
// else if (snapshot.connectionState==ConnectionState.waiting) {
// return Center(child: Text('waiting....',style: InstaPostTheme.lightTextTheme.headline4,),);
// }
// List<Post> ?posts = snapshot.data!;
// return ListView.builder(
// itemCount: snapshot.data!.length,
// itemBuilder: (context, index) =>  PostCard(
// mediaType: posts[index].mediaType,
// username: posts[index].username,
// caption: posts[index].caption,
// timestamp:posts[index].timestamp),
// );
// }
// )