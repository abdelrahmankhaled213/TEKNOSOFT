import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Orders{

String? id;
final int totalprice;
  final String payment;
  final String status;
  final String date;
  final int delivery;
  Orders({  required this.totalprice,required this.payment,required this.status,required this.date,
   required this.delivery});

 factory Orders.fromJson(Map<String,dynamic> json,List<Cart>cart){
   return Orders(
totalprice: json["totalprice"],
     payment: json["payment"],
     status: json["status"],
     date: json["date"],
     delivery: json["delivery"]
   );
 }
  Map<String,dynamic> toJson()=>{
   "totalprice":totalprice,
    "uid":FirebaseAuth.instance.currentUser!.uid,
    "payment":payment,
    "status":status,
    "date":date,
    "delivery":delivery
  };
}