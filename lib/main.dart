import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(initialRoute: "/",
      routes: {
    "/": (context) => Home(),
  }),
  );
}
