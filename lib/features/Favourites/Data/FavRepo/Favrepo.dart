import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/Favmodel.dart';
import 'package:ecommerce_app/features/Favourites/Data/services/favservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FavRepo implements FavServices{
  var firestoreinstance=FirebaseFirestore.instance.collection("favourites");

  @override
  Future<List<FavModel>> getFavData() async{
  var favdata=<FavModel>[];
    await firestoreinstance.where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((value) {

      return value.docs.forEach((element) {
        favdata.add(FavModel.fromJson(element.data()));
      });
    });
    return favdata;
  }

  @override
  int removeItemFromFavourites(String id) {
    // TODO: implement removeItemFromFavourites
   firestoreinstance.doc(id).delete();
    return 0;
  }

  @override
  Future<String> addItemToFavourites(FavModel data) async{
var addedid=await firestoreinstance.add(data.toJson(uid: FirebaseAuth.instance.currentUser!.uid)).
then((DocumentReference reference) => reference.id);
return addedid;
  }

  }
