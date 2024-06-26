import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
abstract class AddressServices {
  Future<List<Addressmodel>> getAddress();
  Future<String> insertData(Addressmodel address);
   deleteData(String id);
   UpdateData(String id,Addressmodel model);

}