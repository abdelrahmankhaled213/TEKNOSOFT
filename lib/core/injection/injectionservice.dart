import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/AddressRepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Category/data/Repo/CategoryRepo.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Home/Data/Repo/homerepo.dart';
import 'package:get_it/get_it.dart';
final getitinstance=GetIt.instance;
void setUpDependencyInjection(){
 getitinstance.registerLazySingleton(() => CacheHelper());
 getitinstance.registerLazySingleton(() => HomeRepo());
 getitinstance.registerLazySingleton(()=>FavRepo());
 getitinstance.registerLazySingleton(()=>CartRepo());
 getitinstance.registerLazySingleton(()=>CategoryRepo());
 getitinstance.registerLazySingleton(()=>AddressRepo());


}