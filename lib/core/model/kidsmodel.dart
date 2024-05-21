import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
class KidsModel extends Product {

  KidsModel({
    required super.lang,
    required super.price,
    required super.image,
    required super.name,
    required super.size
  });
  factory KidsModel.fromJson(Map<String,dynamic>json){
    return KidsModel(
      lang: json['lang'],
        price: json['price'], image: json['image'], name: json['name'],
        size:json['size'] );
  }
}