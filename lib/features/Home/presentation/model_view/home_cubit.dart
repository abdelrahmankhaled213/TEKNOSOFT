import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/Data/webservices/services.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_state.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeCubit extends Cubit<HomeState> {
  final Services services;
  bool connection=false;
  HomeCubit(this.services) :super(InitHomeState());
  Future<List<HomeData>> getHomeData(BuildContext cxt) async {
    emit(HomeLoadingState());
    try {
      var sales = await services.getData();
      var salesarabic=  sales.where((element) => element.lang=="ar").toList();
    var salesenglish=  sales.where((element) => element.lang=="en").toList();
      emit(HomeLoadedState());
      if(EasyLocalization.of(cxt)!.locale==Locale("en"))
      return salesenglish;
      else {
        return salesarabic;
      }
    }
    catch (e) {
      emit(HomeFaliureState(msg: e.toString()));
      return [];
    }
  }
  bool get isconnected{
    emit(HomeInternetState(connection: connection));
    return connection;
}
}



