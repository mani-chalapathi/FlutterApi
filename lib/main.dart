

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/Posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API data using HTTP',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PostListScreen(),
    );
  }
}


