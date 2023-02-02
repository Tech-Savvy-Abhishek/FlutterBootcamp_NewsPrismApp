import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  String url;

  NewsView(this.url);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_add_outlined,
              size: 33,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 33,
            ),
          ),
        ],
        title: Text(
          "NEWS PRISM",
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: Color(0xFFFBF1D3),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0A2647),
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
