class User {
  final Avatar? avatar;
  final String createdAt;
  final String email;
  final String firstName;
  final String gender;
  final int id;
  final String lastName;
  final String provider;
  final String uid;
  final String updatedAt;
  final String username;

  User({
    this.avatar,
    required this.createdAt,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.id,
    required this.lastName,
    required this.provider,
    required this.uid,
    required this.updatedAt,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
      createdAt: json['created_at'],
      email: json['email'],
      firstName: json['first_name'],
      gender: json['gender'],
      id: json['id'],
      lastName: json['last_name'],
      provider: json['provider'],
      uid: json['uid'],
      updatedAt: json['updated_at'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['email'] = email;
    data['first_name'] = firstName;
    data['gender'] = gender;
    data['id'] = id;
    data['last_name'] = lastName;
    data['provider'] = provider;
    data['uid'] = uid;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    if (avatar != null) {
      data['avatar'] = avatar?.toJson();
    }
    return data;
  }
}

class Avatar {
  final AvatarUrl? normal;
  final AvatarUrl? smallThumb;
  final String url;

  Avatar({
    this.normal,
    this.smallThumb,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      normal:
          json['normal'] != null ? AvatarUrl.fromJson(json['normal']) : null,
      smallThumb: json['small_thumb'] != null
          ? AvatarUrl.fromJson(json['small_thumb'])
          : null,
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    if (normal != null) {
      data['normal'] = normal?.toJson();
    }
    if (smallThumb != null) {
      data['small_thumb'] = smallThumb?.toJson();
    }
    return data;
  }
}

class AvatarUrl {
  final String url;

  AvatarUrl({required this.url});

  factory AvatarUrl.fromJson(Map<String, dynamic> json) {
    return AvatarUrl(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
