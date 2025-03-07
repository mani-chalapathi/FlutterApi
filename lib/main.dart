

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
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _nameState();
}

class _nameState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Click the button to fetch the data", style: TextStyle(
                color: Colors.white
              ),),
             SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostListScreen()));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Text("Click here"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

