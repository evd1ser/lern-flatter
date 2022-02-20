class Post {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostsList {
  final List<Post> posts;

  PostsList({
    required this.posts,
  });

  factory PostsList.fromJson(List<dynamic> parsedJson) {

    List<Post> posts = parsedJson.map((i)=>Post.fromJson(i)).toList();

    return PostsList(
      posts: posts,
    );
  }
}