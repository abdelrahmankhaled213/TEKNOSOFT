import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';

abstract class HomeState{

}
class InitHomeState extends HomeState{

}
class HomeLoadingState extends HomeState{

}
class HomeLoadedState extends HomeState{

}
class HomeFaliureState extends HomeState{
String msg;
HomeFaliureState({
  required this.msg
});
}
class AddFavouriteState extends HomeState{

}
class DeleteFavouriteState extends HomeState{

}
class RemoveFavouriteState extends HomeState{
}

class ChangeColorState extends HomeState{

}
class HomeInternetState extends HomeState{
  bool connection;
  HomeInternetState({
    required this.connection
});
}