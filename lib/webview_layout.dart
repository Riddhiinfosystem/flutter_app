import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebViewLayout extends StatefulWidget
{
  @override
  _WebViewLayout createState() => _WebViewLayout();
}

class _WebViewLayout extends State<WebViewLayout>
{

  InAppWebViewController webView;
  String url = "http://www.myscm.co.in/demo?ccode=myscm";
  double progress = 0;
  bool submitting = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[
          Align(

            alignment: Alignment.topLeft,  // and bottomLeft
              child: SafeArea(

                  child: InAppWebView(

                      initialUrl: "http://www.myscm.co.in/demo?ccode=myscm",

                      initialHeaders: {

                      },
                      initialOptions: {

                      },
                      onWebViewCreated: (InAppWebViewController controller) {
                        print("onWebViewCreated");
                        webView = controller;
                        //submitting = true;
                      },
                      onLoadStart: (InAppWebViewController controller, String url) {
                        print("started $url");
                        submitting = true;
                        setState(() {
                          this.url = url;
                        });
                      },
                      onProgressChanged: (InAppWebViewController controller, int progress) {
                        print("onProgressChanged");
                        setState(() {
                          this.progress = progress/100;

                        });
                      },
                    onLoadStop: (InAppWebViewController controller,String url)
                    {
                      print("onLoadStop");
                      submitting = false;
                    },
                    ),
                ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: !submitting
                    ? new Container(
                  color: Colors.grey,
                )
                    : const Center(child: const CircularProgressIndicator()),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (webView != null) {
                  webView.goBack();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (webView != null) {
                  webView.goForward();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {
                if (webView != null) {
                  webView.reload();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}
