class User {
  final String email;
  final String uid;
  final String userName;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const User(
      {required this.email,
      required this.uid,
      required this.userName,
      required this.bio,
      required this.photoUrl,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        'username': userName,
        'uid': uid,
        'email': email,
        'bio': bio,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following
      };
}
