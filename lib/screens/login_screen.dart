import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:insta_post/network/insta_service.dart';

import '../insta_post_theme.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  InstaService instaService = InstaService();
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
                        flutterWeb.launch(uri);
                        flutterWeb.onUrlChanged.listen((uri) async {
                          if (authUrl.contains(redirectUri)) {
                            instaService.getAuth(uri);
                            instaService.getToken().then((token) async {
                              if (token != '') {
                                await instaService.getUserPosts();

                                await flutterWeb.close();
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                              postsList: instaService.postsList,
                                              token: instaService.accessToken,
                                            )));
                              }
                            });
                          } else {}
                        });

                        //await instaService.instaWebView(flutterWeb);
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
