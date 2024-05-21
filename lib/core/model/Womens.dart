import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';

class WomensModel extends Product {
  WomensModel({
    required super.lang,
    required super.price,
    required super.image,
    required super.name,
    required super.size
  });
  factory WomensModel.fromJson(Map<String,dynamic>json){
    return WomensModel(
        lang: json['lang'],price: json['price'], image: json['image'], name: json['name'],
        size:json['size'] );
  }
}