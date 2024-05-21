import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OrderSplashScreen extends StatefulWidget {
  @override
  State<OrderSplashScreen> createState() => _OrderSuccessViewState();
}
class _OrderSuccessViewState extends State<OrderSplashScreen> {
  var cartdata=<Cart>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    removeCartData();
    success();
  }
  void removeCartData()async{
    var cartdata=<Cart>[];
    Cart cart;
    await FirebaseFirestore.
    instance.collection('Cart'). get().then((value) => value.docs.forEach((element) {
   cart= Cart.fromJson(element.data());
   cart.id=element.id;
    cartdata.add(cart);
    }));
    for(int i=0;i<cartdata.length;i++){
     await BlocProvider.of<CartCubit>(context).deleteData( cartdata[i].id!);
    }
  }
  void success() {
     Future.delayed(
      const Duration(
      seconds: 5
    ),
      () {
        goPushReplacement("/BottomNavigationView", context);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Image.asset("assets/Images/cartt.gif",
           height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
       ),
    );
  }
}