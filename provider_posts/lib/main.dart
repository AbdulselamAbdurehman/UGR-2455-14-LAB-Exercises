import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        title: 'Post Viewer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostList(),
      ),
    );
  }
}

class PostProvider extends ChangeNotifier {
  Post? _currentPost;
  int _count = 1;

  Post? get currentPost => _currentPost;

  Future<void> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$_count'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      _currentPost = Post.fromJson(data);
      _count++;
      notifyListeners();
    } else {
      throw Exception('Failed to load post');
    }
  }

  void loadNextPost() {
    fetchPost();
  }
}

class Post {
  final int id;
  final String title;
  final String body;
  final int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (postProvider.currentPost != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      postProvider.currentPost!.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(postProvider.currentPost!.body),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: () => postProvider.loadNextPost(),
              child: const Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
