import 'package:flutter/material.dart';
import 'webview_layout.dart';
void main() => runApp(WebApp());

class WebApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue
      ),
      home: WebViewLayout(),

    );
  }
}



