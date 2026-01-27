import 'package:flutter_riverpod/legacy.dart';
import 'package:punpro_test_app/models/product.dart';

class ProductDetailNotifier extends StateNotifier<Product> {
  ProductDetailNotifier():super(Product());

  void saveDatil(Product product){
    state = product;
  }
}

final productDetailProvider = StateNotifierProvider<ProductDetailNotifier,Product>((ref){
  return ProductDetailNotifier();
});