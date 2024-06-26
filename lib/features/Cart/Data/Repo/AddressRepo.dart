import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/AddressServices.dart';
import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AddressRepo implements AddressServices{
  final collection= FirebaseFirestore.instance.collection("Address");
  final collection2=FirebaseFirestore.instance.collection("Order");

  @override
  Future<List<Addressmodel>> getAddress() async{
  var address=<Addressmodel>[];
await collection.where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((value) {
  Addressmodel addressmodel;
  value.docs.forEach((element) {
     addressmodel=Addressmodel.fromJson(element.data());
   addressmodel.id=element.id;
   address.add(addressmodel);
  });
  return address;
});
  return Future.value(address);
  }
  @override
  Future<String> insertData(Addressmodel address) async{
   var id = await collection.add(address.toJson()).then((value) => value.id);
    return Future.value(id);
  }

  @override
  void deleteData(String id) async{
    await collection.doc(id).delete();
  }

  @override
  void UpdateData(String id,Addressmodel model) async{
await collection.doc(id).update({
  "name": model.name,
  "floor": model.floor,
  "street":model.street,
  "city":model.city,
  "Building":model.Building
}
);
  }







}