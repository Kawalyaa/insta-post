import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:insta_post/network/insta_service.dart';
import 'package:insta_post/screens/web_view.dart';

import '../insta_post_theme.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlutterWebviewPlugin flutterWeb = FlutterWebviewPlugin();

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
                      onTap: () async {

                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebView(

                                )));
                      },
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


// MaterialApp(
// routes: {
// "/": (_) => new WebviewScaffold(
// url: "https://www.google.com",
// appBar: new AppBar(
// title: new Text("Widget webview"),
// ),
// ),
// },
// );