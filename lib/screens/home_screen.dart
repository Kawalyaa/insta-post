import 'package:flutter/material.dart';

import '../insta_post_model.dart';
import '../insta_post_theme.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insta Post'),
        ),
        body: SafeArea(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot<String> snapshot) {
              return ListView();
            },
          ),
        ));
  }
}
