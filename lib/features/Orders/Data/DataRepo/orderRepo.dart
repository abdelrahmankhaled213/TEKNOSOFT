import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Orders/Data/Services/orderservices.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
// class OrderRepo implements OrderServices{
//
// //   @override
// //   Future<List<Orders>> getOrderData() async{
// //     Orders? orders;
// //     var orderlist=<Orders>[];
// //     var detailslist=<Cart>[];
// //    await collection.where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// //        .get().then((value) =>
// //     value.docs.forEach((element) async{
// //       await FirebaseFirestore.instance.collection("Order")
// //           .doc(element.id).collection("Details").get().then(
// //               (value) => value.docs.forEach((element) {
// //             detailslist.add(Cart.fromJson(element.data()));
// //           }));
// //       orders=Orders.fromJson(element.data(),detailslist);
// //       orders!.id=element.id;
// //       orderlist.add(orders!);
// //     })
// //     );
// // return orderlist;
// //   }
// //   @override
// //   cancelOrderData(String id) async{
// //     await collection.doc(id).delete();
// //   }
//
// }