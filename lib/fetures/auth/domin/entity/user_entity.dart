class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String fcmToken;

  UserEntity(
      {required this.name,
      required this.email,
      required this.uId,
      this.fcmToken = ""});

  toMap() => {'name': name, 'email': email, 'uId': uId, 'fcmToken': fcmToken};
}
