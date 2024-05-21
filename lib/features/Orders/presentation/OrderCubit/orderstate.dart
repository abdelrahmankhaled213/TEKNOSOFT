abstract class OrderState{

}
class OrderInitial extends OrderState{

}
class GetOrderDataLoading extends OrderState{

}
class GetOrderDataLoaded extends OrderState{

}
class GetOrderDataFailed extends OrderState{
  final String errormsg;
  GetOrderDataFailed({
    required this.errormsg
});
}
class DeleteOrderLoading extends OrderState{

}
class DeleteOrderLoaded extends OrderState{

}
class DeleteOrderFailed extends OrderState{
  final String errormsg;
  DeleteOrderFailed({
    required this.errormsg
  });
}
