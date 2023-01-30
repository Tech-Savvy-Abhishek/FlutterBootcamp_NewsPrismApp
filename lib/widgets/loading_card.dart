import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.all(0.8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ); //Card
  }
}
