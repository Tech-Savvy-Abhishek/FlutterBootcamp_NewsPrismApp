import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_prism/data/constants.dart';

import '../model/news_query_model.dart';
import '../widgets/loading_card.dart';
import 'news_webviewpage.dart';

class CategoryNews extends StatefulWidget {
  String query;

  CategoryNews(this.query);

  @override
  State<CategoryNews> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryNews> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];

  bool isLoading = true;

  getNewsByQuery(String query) async {
    String url =
        "https://newsapi.org/v2/everything?q=$query&from=2023-02-01&to=2023-02-01&sortBy=popularity&apiKey=2d9d05f2ffc349b99a3c1850bb4c3315";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        try {
          NewsQueryModel newsQueryModel = new NewsQueryModel();
          newsQueryModel = NewsQueryModel.fromMap(element);
          newsModelList.add(newsQueryModel);
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          print(e);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.query);
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
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.query} News",
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
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: isLoading
                        ? Container(
                            child: LoadingCard(),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsView(
                                          newsModelList[index].newsUrl)));
                            },
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
                                      newsModelList[index].newsImg,
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
                                              newsModelList[index].newsHead,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              newsModelList[index]
                                                          .newsDes
                                                          .length >
                                                      50
                                                  ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                  : newsModelList[index]
                                                      .newsDes,
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
                  );
                },
                itemCount: isLoading ? 5 : newsModelList.length,
                // itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
