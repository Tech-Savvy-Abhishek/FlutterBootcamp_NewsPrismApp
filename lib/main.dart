import 'package:flutter/material.dart';
import 'package:news_prism/provider/nav_provider.dart';
import 'package:news_prism/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(),
        ),
      );
}
