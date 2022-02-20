import 'package:flutter/material.dart';
import 'package:ufa/models/Posts.dart';

import '../routes/Routes.dart';

class PostRow extends StatelessWidget {
  const PostRow({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.newspaper_outlined),
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
          ],
        ),
      ),
    );
  }
}