import 'package:flutter/material.dart';
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
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List<Post> posts = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        posts = jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        errorMessage = 'Failed to load posts';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }                   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data from API'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                       elevation: 20,
                       shadowColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                      
                        ),
                        child: ListTile(
                          leading: Text(posts[index].id.toString()),
                          title: Text(posts[index].title, style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text(posts[index].body),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post( {required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body : json['body'],
    );
  }
}
