import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/networking/networking_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Networking_State.dart';
class NetworkingBloc extends Bloc<NetworkingEvent, NetworkingState> {
  StreamSubscription?streamSubscription;
  NetworkingBloc() : super(NetworkingInitial()) {
    on<NetworkingEvent>((event, emit) {
if(event is OnlineEvent){
  return emit(OnlineState(msg: "Connected".tr()));
}
if(event is OfflineEvent){
  return emit(OfflineState(msg: "No Internet Connection".tr()));
}
    });
  }
}
