import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
class BeautyModel extends Product {
  BeautyModel({
    required super.lang,
   required super.price,
   required super.image,
   required super.name,
    required super.size
});
 factory BeautyModel.fromJson(Map<String,dynamic>json){
   return BeautyModel(
       lang: json['lang'],price: json['price']
       , image: json['image'], name: json['name'],
   size:json['size'] );
 }
}