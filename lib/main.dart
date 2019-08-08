import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://google.com";

  launchUrl() {
    setState(() {
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: urlString,
      withZoom: true,
      withJavascript: true,
      scrollBar: false,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.transparent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        minimum: const EdgeInsets.all(16.0),
        child: Text(
            'My Widget: This is my widget. It has some content that I don\'t want '
            'blocked by certain manufacturers who add notches, holes, and round corners.'),
      ),
    );
  }
}
