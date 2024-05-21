class FavModel{
String Uid;
String name;
String image;
List<dynamic>size;
int price;
FavModel({
  required this.Uid,
  required this.name,
  required this.image,
  required this.price,
  required this.size
});
factory FavModel.fromJson(Map<String,dynamic>json){
  return FavModel(
    Uid: json['uid'],
      size: json['size'],
      price: json['price'],
      name: json['name'],
      image: json['image']);
}
Map<String,dynamic> toJson({required String uid}){
  return {
    "uid":uid,
    "price":price,
    "name":name,
    "image":image,
    "size":size,
  };
}
}
class Size {
  int size;
  bool ontap;
  Size({
    required this.size,
    required this.ontap
});
  factory Size.fromJson (Map<String,dynamic>json){
    return Size(size: json["sizemap"], ontap: json['ontap']);
  }
}