import 'package:flutter/material.dart';

import '../insta_post_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Insta Post',
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0.5,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: InstaPostTheme.lightTextTheme.headline1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'with',
                      style: InstaPostTheme.lightTextTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/instagram.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
