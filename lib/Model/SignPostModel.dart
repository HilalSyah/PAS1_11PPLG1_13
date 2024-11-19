class SignUserModel {
  final String username;
  final String password;
  final String fullName;
  final String email;

  SignUserModel({
    required this.username,
    required this.password,
    required this.fullName,
    required this.email,
  });

  // Convert JSON to Model
  factory SignUserModel.fromJson(Map<String, dynamic> json) {
    return SignUserModel(
      username: json['username'],
      password: json['password'],
      fullName: json['full_name'],
      email: json['email'],
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'full_name': fullName,
      'email': email,
    };
  }
}
