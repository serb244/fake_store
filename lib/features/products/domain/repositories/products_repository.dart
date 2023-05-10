import 'package:fake_store/features/products/data/remote/models/products_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getAllProducts();
}
