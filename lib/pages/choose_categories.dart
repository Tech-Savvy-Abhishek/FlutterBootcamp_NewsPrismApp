import 'package:flutter/material.dart';
import 'package:news_prism/data/constants.dart';

class ChooseCategories extends StatelessWidget {
  const ChooseCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chinaIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Categories",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'FaunaOne',
                    fontWeight: FontWeight.bold,
                    color: haliteBlue,
                  ),
                ),
                Row(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
