import 'package:flutter/material.dart';
import 'package:unsplash_test_app/screens/main_screen/main_page.dart';

void main() {
  runApp(UnsplashApp());
}

class UnsplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash App',
      theme: ThemeData(
        accentColor: Colors.grey[400],
        canvasColor: Colors.transparent,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
