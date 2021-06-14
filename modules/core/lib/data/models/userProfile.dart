import 'dart:convert';

class UserProfile {
  String? name;
  String? email;
  bool? isMargemUser;
  bool? isOffertaUser;
  UserProfile({
    this.name,
    this.email,
    this.isMargemUser = true,
    this.isOffertaUser = false,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    bool? isMargemUser,
    bool? isOffertaUser,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      isMargemUser: isMargemUser ?? this.isMargemUser,
      isOffertaUser: isOffertaUser ?? this.isOffertaUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'isMargemUser': isMargemUser,
      'isOffertaUser': isOffertaUser,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      email: map['email'],
      isMargemUser: map['isMargemUser'],
      isOffertaUser: map['isOffertaUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(name: $name, email: $email, ' +
        'isMargemUser: $isMargemUser, isOffertaUser: $isOffertaUser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
        other.name == name &&
        other.email == email &&
        other.isMargemUser == isMargemUser &&
        other.isOffertaUser == isOffertaUser;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        isMargemUser.hashCode ^
        isOffertaUser.hashCode;
  }
}
