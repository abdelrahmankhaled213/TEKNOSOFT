class UserModel{
  String? id;
  final String name;
   String email;
   String password;
  UserModel({required this.name,required this.email,required this.password, this.id,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String,dynamic>toJson(){
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "password": this.password
    };
  }
}