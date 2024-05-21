import 'package:ecommerce_app/features/Cart/Data/Services/cartservices.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/Favmodel.dart';
import 'package:ecommerce_app/features/Favourites/Data/services/favservices.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavCubit extends Cubit<FavState> {
  FavServices services;
CartServices cartServices;
  FavCubit(this.services,this.cartServices) :super(InitialState());
  bool favstate = false;
  bool cartstate=false;
  int selectedindex=0;
var counter=1;
int updateIndex(int index){
  selectedindex=index;
  emit(UpdateIndexState());
  return selectedindex;
}
Future<List<FavModel>>getFavData()async{
  var favlist=<FavModel>[];
  try {
    emit(GetLoadingFavState());
  favlist=  await services.getFavData();
    emit(GetLoadedFavState());
    return favlist;
  }
  catch(e){
    emit(GetFaliureFavState(errormsg: e.toString()));
    return [];
  }
}
 Future<String> insertDataCart(Cart cart)async{
    try {
      emit(CartInsertLoading());
     var id= await cartServices.insertData(cart);
     cartstate=true;
      emit(CartInsertSuccess());
      return id;
    }catch (e) {
      emit(CartInsertFailed(
      errormsg:   e.toString(),
      ));
      return "";
    }
  }
deleteDataCart(String id)async{
  await cartServices.deleteData(id);
  cartstate=false;
  emit(CartDeleteSuccess());
}

  increaseCount(){
    counter++;
    emit(AddCounterState());
  }
  decreaseCount(){
    if(counter<=1){
      return;
    }
    counter--;
    emit(RemoveCounterState());
  }
 removeFavourites(String id)async{
     await services.removeItemFromFavourites(id);
    favstate=false;
    emit(RemoveFavState());
}
Future<String> addFavourites(FavModel data)async{
        var id=await services.addItemToFavourites(data);
      favstate=true;
    emit(AddFavState());
    return id;
}

}