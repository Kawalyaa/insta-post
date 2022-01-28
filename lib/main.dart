import 'package:flutter/material.dart';
import 'package:insta_post/insta_post_theme.dart';

void main() {
  runApp(const InstaPost());
}

class InstaPost extends StatelessWidget {
  const InstaPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = InstaPostTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
