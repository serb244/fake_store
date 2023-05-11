import 'package:fake_store/core/data/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductByID(int id);
}
