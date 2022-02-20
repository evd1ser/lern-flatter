class User {
  final int id;
  final String name;
  final String username;
  final String email;
  // final String address;
  final String phone;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }
}

class UsersList {
  final List<User> users;

  UsersList({
    required this.users,
  });

  factory UsersList.fromJson(List<dynamic> parsedJson) {

    List<User> users = parsedJson.map((i)=>User.fromJson(i)).toList();

    return UsersList(
      users: users,
    );
  }
}