class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TodoList {
  final List<Todo> todos;

  TodoList({
    required this.todos,
  });

  factory TodoList.fromJson(List<dynamic> parsedJson) {

    List<Todo> todos = parsedJson.map((i)=>Todo.fromJson(i)).toList();

    return TodoList(
      todos: todos,
    );
  }
}