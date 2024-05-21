import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';

abstract class CartServices{
Future<String>insertData(Cart cart);
deleteData(String id);
}