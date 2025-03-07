import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
       backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Fectching Data from  API', style: TextStyle(
          color: Colors.white

        ),),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(
            color: Colors.white,
          ))
          : errorMessage.isNotEmpty
              ? Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(errorMessage, style: TextStyle(
                  color: Colors.white
                ),),
              ))
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
                          leading: Text(posts[index].id.toString(),style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold
                          ),),
                          title: Text(posts[index].title, style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text(posts[index].body),
                          trailing:  CircleAvatar(
                            child: Text(posts[index].userId.toString(),style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold
                            ),),
                          ),
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
  final int userId;

  Post( {required this.id, required this.title, required this.body, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body : json['body'],
      userId: json['userId']
    );
  }
}