import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFF808080),
      highlightColor: Color(0xFFC2C2C2),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        height: 250,
        width: double.infinity,
        padding: EdgeInsets.all(0.8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ); //Card
  }
}
