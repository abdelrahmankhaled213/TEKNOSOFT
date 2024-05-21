import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/Category/data/Services/Categoryservices.dart';
import 'package:ecommerce_app/features/Category/presentation/model_view/category_state.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  final CategoryServices services;
  CategoryCubit(
  {
    required this.services
}
      ):super(CategoryInitial());
  Future<List<Product>>getData(String collection,BuildContext context)async{
    try{
      emit(GetDataLoading());
     var productlist= await services.getProduct(collection);
      emit(GetDataLoaded());
    var productlisten= productlist.where((element) => element.lang=="en").toList();
      var productlistar= productlist.where((element) => element.lang=="ar").toList();
      if(BlocProvider.of<SettingsCubit>(context).currentlang=="en")
        return Future.value(productlisten);
            else
        return Future.value(productlistar);


    }
    catch(e){
emit(GetDataFailed(errormsg: e.toString()));
return [];
    }
  }

}