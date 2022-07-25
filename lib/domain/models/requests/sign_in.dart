class SignInRequest {
  final SignInData? user;

  SignInRequest({required this.user});

  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return SignInRequest(
      user: json['user'] != null ? SignInData.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user?.toJson() ?? '';
    return data;
  }
}

class SignInData {
  final String email;
  final String password;

  SignInData({
    required this.email,
    required this.password,
  });

  factory SignInData.fromJson(Map<String, dynamic> json) {
    return SignInData(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
