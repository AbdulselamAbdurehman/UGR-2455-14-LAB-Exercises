import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add_post': (context) => const AddPostScreen(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Posts"),
        backgroundColor: Colors.blue[400],
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.posts.isEmpty) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("No posts for now!"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/add_post'); // Navigate to add post screen
                      },
                      child: const Text("Add your post"),
                    ),
                  ]),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    Post post = postProvider.posts[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.post_add,
                          size: 50.0,
                        ),
                        title: Text(
                          post.title,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          post.body,
                          textAlign: TextAlign.justify,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Provider.of<PostProvider>(context, listen: false)
                                .deletePost(post.id);
                          },
                          icon: const Icon(Icons.delete_rounded,
                              color: Colors.red),
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/add_post'); // Navigate to add post screen
                },
                child: const Text("Add your post"),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PostProvider>(context, listen: false).fetchPost();
          Provider.of<PostProvider>(context, listen: false).incrementIndex();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              maxLines: null, // Allow multiple lines for body
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(" "),
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text;
                    String body = bodyController.text;
                    Post newPost = Post(
                        id: 0,
                        title: title,
                        body: body); // Id will be set by the server
                    Provider.of<PostProvider>(context, listen: false)
                        .addPost(newPost);
                    Navigator.pop(context); // Navigate back to home screen
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title'], body: json['body']);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}

class PostProvider with ChangeNotifier {
  final List<Post> _posts = [];
  List<Post> get posts => _posts;
  int _currentIndex = 0;

  Future<void> fetchPost() async {
    final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/$_currentIndex"));
    if (response.statusCode == 200) {
      Map<String, dynamic> postJson = json.decode(response.body);
      Post newPost = Post.fromJSON(postJson);
      _posts.add(newPost);
      notifyListeners();
    } else {
      throw Exception("Failed to fetch post");
    }
  }

  Future<void> addPost(Post post) async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userId': 1, // Assuming userId is always 1
        'id': _currentIndex, // Use current index
        'title': post.title,
        'body': post.body,
      }),
    );
    if (response.statusCode == 201) {
      Post newPost = Post.fromJSON(json.decode(response.body));
      incrementIndex();
      _posts.add(newPost);
      notifyListeners();
    } else {
      throw Exception("Failed to add post");
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http
        .delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
    if (response.statusCode == 200) {
      // Assuming 200 is returned for successful deletion
      _posts.removeWhere((post) => post.id == id);
      notifyListeners();
    } else {
      throw Exception("Failed to delete post");
    }
  }

  void incrementIndex() {
    _currentIndex++;
  }
}
