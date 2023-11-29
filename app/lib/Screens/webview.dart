import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class webview extends StatefulWidget {
  const webview({super.key, required this.href});
  final String href;

  @override
  State<webview> createState() => _webviewState();
}

class _webviewState extends State<webview> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Expanded(
            flex: 1,
            child: webview(),
          ),
        ));
  }

  WebView webview() {
    return WebView(
      initialUrl: widget.href,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
