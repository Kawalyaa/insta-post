import 'package:flutter/material.dart';

import '../insta_post_theme.dart';

class HomeScreen extends StatefulWidget {
  final String? token;

  const HomeScreen({this.token, Key? key}) : super(key: key);

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
        child: Center(
          child: Text(
            '${widget.token}KKKKKKKKKKKKKKKK',
            style: InstaPostTheme.lightTextTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
