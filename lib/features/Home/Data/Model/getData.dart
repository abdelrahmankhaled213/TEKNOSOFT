import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
class HomeData extends Product{
  String? id;
  HomeData({
  required super.lang,
     this.id,
   required super.size,
required super.price,
    required super.name,
    required super.image,
  });
  factory HomeData.fromJson(Map<String,dynamic>json){
    return HomeData(
      lang: json['lang'],
        size: json['size'],
        price: json['price'],
        name: json['name'],
        image: json['image']);
  }
  Map<String,dynamic> toJson(){
    return {
      "lang":this.lang,
      "price":this.price,
      "name":this.name,
      "image":this.image,
      "size":this.size,

    };
  }

}
