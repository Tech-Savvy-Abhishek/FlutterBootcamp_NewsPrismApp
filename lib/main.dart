import 'package:flutter/material.dart';
import 'package:news_prism/splash.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(initialRoute: "/",
      routes: {
    "/": (context) => Splash(),
  }),
  );
}
