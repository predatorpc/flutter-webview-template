import 'package:discount_app/about.dart';
import 'package:flutter/material.dart';
import 'default.dart';

void main() => runApp(WallpaperApp());

class WallpaperApp extends StatefulWidget {

  @override
  _WallpaperState createState() => new _WallpaperState();
}

class _WallpaperState extends State<WallpaperApp> {

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        'Default': (BuildContext context) => DefaultPage(),
        'About'  : (BuildContext context) => AboutPage(),
      },
      initialRoute: 'Default',
    );
  }

}