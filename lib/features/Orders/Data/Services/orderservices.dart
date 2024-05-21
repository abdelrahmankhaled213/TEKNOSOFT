import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';

abstract class OrderServices{
  Future<List<Orders>>getOrderData();
  cancelOrderData(String id);
}