import 'package:flutter/material.dart';

class ReadLater extends StatefulWidget {
  const ReadLater({Key? key}) : super(key: key);

  @override
  State<ReadLater> createState() => _ReadLaterState();
}

class _ReadLaterState extends State<ReadLater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "READ LATER",
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: Color(0xFFFBF1D3),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
