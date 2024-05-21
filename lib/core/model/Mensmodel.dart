import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';

class MensModel extends Product {

  MensModel({
    required super.lang,
    required super.price,
    required super.image,
    required super.name,
    required super.size
  });
  factory MensModel.fromJson(Map<String,dynamic>json){
    return MensModel(
      lang: json['lang'],
        price: json['price'], image: json['image'], name: json['name'],
        size:json['size'] );
  }
}