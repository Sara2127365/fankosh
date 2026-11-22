class UserModel {
  final String email;
  final String? password;
  final String name;
  final List<dynamic> fav;
  final String? imageUrl;
  

  UserModel({
    required this.email,
     this.password,
    required this.name,
    required this.fav,
     this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'name': name, 'fav': fav,"imageUrl":imageUrl};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      fav: json['fav'],
      imageUrl: json['imageUrl'],
    );
  }

  UserModel copyWith({String? email, String? password, String? name,List? fav,String? imageUrl}) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      fav: fav?? this.fav,
      imageUrl: imageUrl??this.imageUrl
    );
  }
}
