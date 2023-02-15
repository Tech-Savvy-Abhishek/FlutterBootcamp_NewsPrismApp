import 'package:hive/hive.dart';

part 'localdb.g.dart';

@HiveType(typeId: 1)
class LocalDBModel {
  @HiveField(0)
  late String newsHead;
  @HiveField(1)
  late String newsDes;
  @HiveField(2)
  late String newsImg;
  @HiveField(3)
  late String newsUrl;

  LocalDBModel(
      {this.newsHead = "NEWS HEADLINE",
      this.newsDes = "SOME NEWS",
      this.newsImg = "SOME URL",
      this.newsUrl = "SOME URL"});
}
