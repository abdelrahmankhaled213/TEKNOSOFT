import 'package:firebase_auth/firebase_auth.dart';

class Addressmodel {
   String? id;
 final String? name;
 final String? city;
  final String? street;
  final int? Building;
  final int? floor;
   String? uid;

  Addressmodel(
      {
     this.uid,
        required this.floor,
        required this.name,
      required this.city,
     required this.street,
      required this.Building});
factory
Addressmodel.fromJson(Map<String, dynamic> json) {
  return Addressmodel(
    uid: json['uid'],
    floor: json['floor'],
    name: json['name'],
    city: json['city'],
    street: json['street'],
    Building: json['Building'],
  );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid':FirebaseAuth.instance.currentUser!.uid,
      'name': name,
      'city': city,
      'street': street,
      'Building': Building,
      'floor': floor,
    };
}
}