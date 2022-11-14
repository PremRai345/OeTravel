class FirebaseUser {
  late String? displayName;
  late String? email;
  late String? photoUrl;
  late String uuid;

  FirebaseUser({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.uuid,
  });

  Map toJson() {
    final map = {};
    map["uuid"] = uuid;
    map["name"] = displayName;
    map["photoUrl"] = photoUrl;
    map["email"] = email;
    return map;
  }
}
