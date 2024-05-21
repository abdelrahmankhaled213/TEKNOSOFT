import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
abstract class Services{

  Future<List<HomeData>> getData();

}