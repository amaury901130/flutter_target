class SignUpRequest {
  final SignUpData? user;

  SignUpRequest({required this.user});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return SignUpRequest(
      user: json['user'] != null ? SignUpData.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user?.toJson() ?? '';
    return data;
  }
}

class SignUpData {
  final String email;
  final String gender;
  final String password;
  final String passwordConfirmation;
  final String username;

  SignUpData({
    required this.email,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
    required this.username,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) {
    return SignUpData(
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['gender'] = gender;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['username'] = username;
    return data;
  }
}
