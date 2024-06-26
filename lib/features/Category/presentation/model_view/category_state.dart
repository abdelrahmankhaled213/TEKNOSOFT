import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';

abstract class CategoryState {

}
class CategoryInitial extends CategoryState{

}
class GetDataLoading extends CategoryState{

}
class GetDataLoaded extends CategoryState{

}
class GetDataFailed extends CategoryState {
  final String errormsg;

  GetDataFailed({
    required this.errormsg
  });
}

class SearchItemState extends CategoryState{

}









