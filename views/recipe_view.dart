import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  final String postUrl;
  const RecipeView({super.key,required this.postUrl});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {

  // ignore: unused_field
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String finalUrl = "" ;
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    finalUrl = widget.postUrl;
    if(widget.postUrl.contains('http://')){
      finalUrl = widget.postUrl.replaceAll("http://","https://");
      // print(finalUrl + "this is final url");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: Platform.isIOS? 60: 30, right: 24,left: 24,bottom: 16),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff213A50),
                      Color(0xff071930)
                    ],
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft)),
            child:  const Row(
              mainAxisAlignment: kIsWeb
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "AppGuy",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Overpass'),
                ),
                Text(
                  "Recipes",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'Overpass'),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - (Platform.isIOS ? 104 : 30),
            width: MediaQuery.of(context).size.width,
            child: WebViewWidget(
              controller: webViewController..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(finalUrl)),
            ),
          ),
        ],
      )
    );
  }
}
