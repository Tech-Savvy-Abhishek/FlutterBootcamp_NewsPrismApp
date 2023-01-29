import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_prism/data/constants.dart';

import '../model/news_query_model.dart';

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
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2d9d05f2ffc349b99a3c1850bb4c3315";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
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
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu_outlined,
              size: 33,
            ),
          ),
        ),
        title: Text(
          widget.query,
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
        child: isLoading
            ? Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: CircularProgressIndicator()))
            : Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
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
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.1),
                                          Colors.black,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )),
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
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
                                        newsModelList[index].newsDes.length > 50
                                            ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                            : newsModelList[index].newsDes,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: newsModelList.length,
                ),
              ),
      ),
    );
  }
}
