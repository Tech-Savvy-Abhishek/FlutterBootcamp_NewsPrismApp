import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:news_prism/data/constants.dart';

import 'news_webviewpage.dart';

class ReadLater extends StatefulWidget {
  const ReadLater({Key? key}) : super(key: key);

//MODIFIED
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
      backgroundColor: chinaIvory,
      appBar: AppBar(
        actions: [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Saved News",
                      style: TextStyle(
                        fontFamily: 'FaunaOne',
                        color: Colors.grey[800],
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: savedNewsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsView(savedNewsList[index].newsUrl)));
                      },
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              icon: Icons.delete,
                              backgroundColor: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              label: "Delete",
                            ),
                            SlidableAction(
                              onPressed: null,
                              icon: Icons.send,
                              backgroundColor: Colors.blueGrey,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              label: "Share",
                            ),
                          ],
                        ),
                        child: Container(
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    savedNewsList[index].newsImg,
                                    fit: BoxFit.fitHeight,
                                    height: 250,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(0.1),
                                              Colors.black,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 15, 10, 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            savedNewsList[index].newsHead,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            savedNewsList[index]
                                                        .newsDes
                                                        .length >
                                                    50
                                                ? "${savedNewsList[index].newsDes.substring(0, 55)}...."
                                                : savedNewsList[index].newsDes,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchList() {
    var box = Hive.box("SavedNews");
    savedNewsList = box.get("savednews", defaultValue: []);
  }
}
