import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/cartservices.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
class CartRepo implements CartServices {
  CollectionReference collection = FirebaseFirestore.instance.collection(
      "Cart");
  @override
  Future<String> insertData(Cart cart) async {
    var id = await collection.add(cart.toJson()).then((value) => value.id);
    return id;
  }

  @override
  deleteData(String id) async {
 await collection.doc(id).delete();
  }
}