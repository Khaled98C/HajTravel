class User {
  final String  currentUsername; // يتم تحديده عند تسجيل الدخول

  final String password;
  final String gender;
  final String email;
  final String birthday;

  User({
    required this.currentUsername,
    required this.password,
    required this.gender,
    required this.email,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'username':currentUsername,
        'password': password,
        'gender': gender,
        'email': email,
        'birthday': birthday,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        currentUsername: json['username'],
        password: json['password'],
        gender: json['gender'],
        email: json['email'],
        birthday: json['birthday'],
      );
}
