import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_prism/pages/news_by_category.dart';
import 'package:news_prism/widgets/loading_card.dart';
import 'package:news_prism/widgets/navigation_drawer.dart';

import 'model/news_query_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];

  bool isLoading = true;
  bool isLoadingCarousel = true;

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

  getNewsofIndia() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=2d9d05f2ffc349b99a3c1850bb4c3315";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelListCarousel.add(newsQueryModel);
        setState(() {
          isLoadingCarousel = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery("corona");
    getNewsofIndia();
  }

  @override
  Widget build(BuildContext context) {
    var searchHintsList = ["All", "Sports", "Health", "Science", "Politics"];
    final random = new Random();
    var searchHint = searchHintsList[random.nextInt(searchHintsList.length)];

    TextEditingController searchController = new TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFFBF1D3),
      drawer: NavigationDrawer(),
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
            //search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black12,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(Icons.search_outlined),
                      margin: EdgeInsets.fromLTRB(3, 0, 8, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        print("$value");
                      },
                      decoration: InputDecoration(
                        hintText: "search $searchHint news",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //text above carousel slider
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top News",
                    style: TextStyle(
                      fontFamily: 'FaunaOne',
                      color: Colors.grey[800],
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            //carouselSlider showing top news
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: isLoadingCarousel
                  ? CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0, enlargeCenterPage: true),
                      items: [LoadingCard()])
                  : CarouselSlider(
                      items: newsModelListCarousel.map((instance) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                              child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    instance.newsImg,
                                    fit: BoxFit.fitHeight,
                                    height: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black.withOpacity(0.5),
                                          Colors.black,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 10),
                                      child: Text(
                                        instance.newsHead,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'FaunaOne',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                        });
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's News",
                      style: TextStyle(
                        fontFamily: 'FaunaOne',
                        color: Colors.grey[800],
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),

            //category tabs
            Container(
              margin: EdgeInsets.fromLTRB(18, 15, 18, 15),
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryNews(searchHintsList[index])));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A2647),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          searchHintsList[index],
                          style: TextStyle(
                              fontFamily: 'FaunaOne',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: searchHintsList.length,
                scrollDirection: Axis.horizontal,
              ),
            ),

            //listview showing news cards
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
                        : Card(
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
                                              Colors.black.withOpacity(0),
                                              Colors.black.withOpacity(0.5),
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
                                                : newsModelList[index].newsDes,
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
                  );
                },
                itemCount: isLoading ? 5 : newsModelList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
