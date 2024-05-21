import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';

abstract class CategoryServices{
  Future<List<Product>>getProduct(String id);
}