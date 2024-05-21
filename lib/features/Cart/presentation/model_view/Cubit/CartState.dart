abstract class CartState{
}
class CartInitial extends CartState{

}

class CartLoading extends CartState{

}
class CartSuccess extends CartState{

}
class CartError extends CartState{
  String error;
  CartError(this.error);
}
class CartDelete extends CartState {
}

class CartDeleteError extends CartState {
  String error;
  CartDeleteError(this.error);
}
class ChoosePaymentMethodState extends CartState {

}
class AddressLoading extends CartState{
}
class AddressSuccess extends CartState{
}
class AddressError extends CartState{
  String error;
  AddressError(this.error);
}
class InsertDataLoading extends CartState {
}
class InsertDataSuccess extends CartState {
}
class InsertDataError extends CartState {
  final String error;
  InsertDataError(this.error);
}
class UpdateAddressSuccess extends CartState{

}
class UpdateAddressFailed extends CartState {
  String errormsg;
  UpdateAddressFailed({
    required this.errormsg
  });
}
class DeleteAddressSuccess extends CartState{
}
class DeleteAddressFailed extends CartState {
  String errormsg;
  DeleteAddressFailed({
    required this.errormsg
  });
}
class RefreshChoiceState extends CartState {
}
class SelectAddressState extends CartState{
}
class InsertOrderLoadingDataState extends CartState{
}
class InsertOrderSuccessDataState extends CartState{
}
class InsertOrderFailedDataState extends CartState{
  String error;
  InsertOrderFailedDataState(this.error);
}