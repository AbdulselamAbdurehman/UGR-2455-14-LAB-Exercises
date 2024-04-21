import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PostBloc(),
        child: PostList(),
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Viewer'),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, Post>(
          builder: (context, post) {
            return post.id != 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          post.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(post.body),
                      ],
                    ),
                  )
                : CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(FetchPost());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

abstract class PostEvent {}

class FetchPost extends PostEvent {}

class PostBloc extends Bloc<PostEvent, Post> {
  PostBloc() : super(Post(id: 0, title: '', body: '', userId: 0));

  int _count = 1;

  @override
  Stream<Post> mapEventToState(PostEvent event) async* {
    if (event is FetchPost) {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$_count'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        yield Post.fromJson(data);
        _count++;
      } else {
        throw Exception('Failed to load post');
      }
    }
  }
}
