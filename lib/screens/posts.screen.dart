import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ufa/models/Posts.dart';
import 'package:ufa/widgets/drawer.dart';
import 'package:ufa/widgets/myAppBar.dart';
import 'package:http/http.dart' as http;

import '../components/PostRow.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/posts';

  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<PostsList> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  Future<PostsList> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PostsList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(context, "Posts"),
      drawer: AppDrawer(),
      body: Center(
        child: FutureBuilder<PostsList>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data!.posts;
              return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      var post = posts[index];
                      return PostRow(post: post);
                    });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}