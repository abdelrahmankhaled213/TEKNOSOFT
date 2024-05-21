 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/Data/webservices/services.dart';
class HomeRepo implements Services{
  @override
  Future<List<HomeData>> getData() async{
    var home=<HomeData>[];
 await FirebaseFirestore.instance.collection('sales').
    get().
    then(
            (value) =>
                value.docs.forEach(
                    (element) {
      home.add(
          HomeData.
      fromJson(element.data()
      )
      );
    }
    )
    );
    return home;
  }
}