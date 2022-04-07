
class User {
  final String uid;
  final String username;
  final String password;

  User({required this.uid, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'password': password});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

 
}
