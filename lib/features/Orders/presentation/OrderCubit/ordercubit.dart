import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/Orders/presentation/OrderCubit/orderstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OrderCubit extends Cubit<OrderState> {
  OrderCubit() :super(OrderInitial());

}