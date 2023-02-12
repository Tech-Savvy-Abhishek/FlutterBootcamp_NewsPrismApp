import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ReadLater extends StatefulWidget {
  const ReadLater({Key? key}) : super(key: key);

  @override
  State<ReadLater> createState() => _ReadLaterState();
}

class _ReadLaterState extends State<ReadLater> {
  late List savedNewsList;

  @override
  void initState() {
    super.initState();
    fetchList();
  }

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
      body: ListView.builder(
        itemCount: savedNewsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Text(
              savedNewsList[index],
            ),
          );
        },
      ),
    );
  }

  void fetchList() {
    var box = Hive.box("SavedNews");
    savedNewsList = box.get("savednews", defaultValue: []);
  }
}
