import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../network/insta_service.dart';
import 'home_screen.dart';

class WebView extends StatelessWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterWebviewPlugin webPlugin = FlutterWebviewPlugin();
    InstaService instaService = InstaService();

    returnToPosts(webPlugin, instaService, context);

    return WebviewScaffold(url: uri,appBar: AppBar(
      title: const Text('Insta Post'),
    ) ,);
  }


  Future<void> returnToPosts(FlutterWebviewPlugin webView,InstaService instaService,BuildContext context)async{

    webView.onUrlChanged.listen((uri) async {
      if (uri.contains(redirectUri)) {
        instaService.getAuth(uri);
        instaService.getToken().then((token) async {
          if (token != '') {
            await webView.close();

            await instaService
                .getUserPosts().then((value) async{
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  HomeScreen(
postList: value,
                      )));
            });

          }
        }
        );
      }
    });



  }

}
