import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/model/Beautymodel.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/Category/data/Services/Categoryservices.dart';
class CategoryRepo extends CategoryServices{
  @override
  Future<List<Product>> getProduct(String collection) async{
    final productinstance=FirebaseFirestore.instance.collection("$collection");
   var productlist=<Product>[];
  await  productinstance.get().then((value) => value.docs.forEach((element) {
     productlist.add(BeautyModel.fromJson(element.data()));
   }));
    return Future.value(productlist);
  }
}