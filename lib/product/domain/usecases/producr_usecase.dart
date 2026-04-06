import 'package:product/product/domain/entities/product_entity.dart';
import 'package:product/product/domain/repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;
  ProductUseCase(this.productRepository);
  Future<List<ProductEntity>> call() async{
    return await productRepository.fetchProducts();
  }
}