import 'package:flutter/material.dart';
import 'package:insta_post/insta_post_theme.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const InstaPost());
}

class InstaPost extends StatelessWidget {
  const InstaPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = InstaPostTheme.light();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
