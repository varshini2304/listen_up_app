import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebView extends StatelessWidget {
  final String url;
  BookWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Preview')),
      body: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(url))),
    );
  }
}
 