import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SETTINGS",
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: Color(0xFFFBF1D3),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
