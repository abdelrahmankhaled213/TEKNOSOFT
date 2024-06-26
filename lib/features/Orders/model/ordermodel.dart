import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';

class OrderModel{
 List<Cart>cart;
 String date;
  OrderModel({
  required this.cart,
    required this.date
  });
}