class LiveUser {
  final String userId;
  final String name;
  bool isAdmin;

  LiveUser({required this.userId, required this.name, this.isAdmin = false});
}
