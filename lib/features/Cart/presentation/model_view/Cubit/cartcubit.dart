import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/AddressServices.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/cartservices.dart';
import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/CartState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartCubit extends Cubit<CartState> {
  final CartServices cartServices;
  final AddressServices addressServices;
  String name = "";
  int? Building;
  int? floor;
  String city = "please select city";
  String? street;
   var paymentvalue = "";
var selectedindex=0;
  var paymentMethods = <Payment>[
    Payment(name: "CreditCard", image: "assets/Images/img_9.png"),
    Payment(name: "Vodafone Cash", image: "assets/Images/img_10.png"),
    Payment(name: "Fawry", image: "assets/Images/img_11.png"),
    Payment(name: "Cash", image: "assets/Images/img_8.png")
  ];

  CartCubit({required this.cartServices, required this.addressServices})
      : super(CartInitial());
void selectAddress(int index){
  selectedindex=index;
  emit(SelectAddressState());
}
  void choosePaymentmethod(String value) async {
    paymentvalue = value;
    emit(ChoosePaymentMethodState());
  }

  void refreshChoice(String value) {
    city = value;
    emit(RefreshChoiceState());

  }

  deleteData(String id) async {
    try {
      await cartServices.deleteData(id);
      emit(CartDelete());
    } catch (e) {
      emit(CartDeleteError(e.toString()));
    }
  }

  Future<List<Addressmodel>> getAddressData() async {
    try {
      emit(AddressLoading());
      var addresslist = await addressServices.getAddress();
      emit(AddressSuccess());
      return addresslist;
    } catch (e) {
      emit(AddressError(e.toString()));
      return [];
    }
  }

  Future<String> insertData(Addressmodel model) async {
    try {
      emit(InsertDataLoading());
      var id = await addressServices.insertData(model);
      emit(InsertDataSuccess());
      return id;
    } catch (e) {
      emit(InsertDataError(e.toString()));
      return "";
    }
  }

   updateAddressData(
      {required String id, required Addressmodel model}) async {
    try {
      await addressServices.UpdateData(id, model);
      emit(UpdateAddressSuccess());
    } catch (e) {
      emit(UpdateAddressFailed(errormsg: e.toString()));
    }
  }

   deleteAddressData({
    required String id
  }) async{
    try {
      await addressServices.deleteData(id);
      emit(DeleteAddressSuccess());
    } catch (e) {
emit(DeleteAddressFailed( errormsg: e.toString()));
    }
  }


}
 class Payment {
  final String name;
final String? image;
   Payment({required this.name, this.image});
 }
