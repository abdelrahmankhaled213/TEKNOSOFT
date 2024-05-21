import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Orders/Data/Services/orderservices.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';
import 'package:ecommerce_app/features/Orders/presentation/OrderCubit/orderstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OrderCubit extends Cubit<OrderState>{
  OrderCubit(
      ):super(OrderInitial());
  Future<List<Orders>>getOrderData()async{
    try{
      Orders? orders;
      var orderlist=<Orders>[];
      var detailslist=<Cart>[];
      await FirebaseFirestore.instance.collection("Order")
          .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get().then((value) =>
          value.docs.forEach((element) async{
            await FirebaseFirestore.instance.collection("Order")
                .doc(element.id).collection("Details").get().then(
                    (value) => value.docs.forEach((element) {
                  detailslist.add(Cart.fromJson(element.data()));
                })
            );
            emit(GetOrderDataLoaded());
            orders=Orders.fromJson(element.data(),detailslist);
            orders!.id=element.id;
            orderlist.add(orders!);
          })
      );
      return orderlist;
    }catch(e){
      emit(GetOrderDataFailed(errormsg: e.toString()));
      return [];
    }
  }
deleteData(String id)async{
  await FirebaseFirestore.instance.collection("Order").doc(id).delete();
  emit(DeleteOrderLoaded(
  ));
}
}