import 'package:ecommerce_app/features/Favourites/Data/model/Favmodel.dart';


abstract class FavServices {

  int removeItemFromFavourites(String id);
Future<List<FavModel>>getFavData();
  Future<String> addItemToFavourites(FavModel data);
}