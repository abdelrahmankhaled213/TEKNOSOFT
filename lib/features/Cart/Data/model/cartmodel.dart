import 'package:firebase_auth/firebase_auth.dart';
class Cart {
   String? id;
 final String image;
  final int price;
 final String name;
   final int Quantitiy;
  final dynamic size;
  Cart({
     this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.Quantitiy,
    required this.size});
  factory Cart.fromJson(Map<String,dynamic> json){
    return Cart(
      image: json['image'],
      price: json['price'],
      name: json['name'],
      Quantitiy: json['Quantitiy'],
      size: json['size'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      "image":this.image,
      "uid":FirebaseAuth.instance.currentUser!.uid,
      "price":this.price,
      "name":this.name,
      "Quantitiy":this.Quantitiy,
      "size":this.size,
    };
  }
}