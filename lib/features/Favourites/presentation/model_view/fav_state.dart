abstract class FavState{

}
class InitialState extends FavState{

}
class GetFavDocuments extends FavState{
List<String>Documents;
GetFavDocuments({
  required this.Documents
});
}
class GetLoadingFavState extends FavState{

}
class GetLoadedFavState extends FavState{

}
class GetFaliureFavState extends FavState{
   final String errormsg;
   GetFaliureFavState({
   required this.errormsg
});
}
class RemoveFavState extends FavState{

}
class AddFavState extends FavState{

}
class UpdateIndexState extends FavState{

}
class RemoveCounterState extends FavState{

}
class AddCounterState extends FavState{

}
class CartInsertLoading extends FavState{

}
class CartInsertSuccess extends FavState{

}
class CartInsertFailed extends FavState {
  String errormsg;

  CartInsertFailed({
    required this.errormsg
  });

}
class CartDeleteSuccess extends FavState{

}