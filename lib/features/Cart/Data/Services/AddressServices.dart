import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';

abstract class AddressServices {
  Future<List<Addressmodel>> getAddress();
  Future<String> insertData(Addressmodel address);
   deleteData(String id);
   UpdateData(String id,Addressmodel model);

}