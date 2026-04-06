import 'package:product/product/data/datasource/data_product_service.dart';
import 'package:product/product/domain/entities/product_entity.dart';
import 'package:product/product/domain/repository/product_repository.dart';

class DataProductRepository implements ProductRepository {
  final DataProductService dataProductService;
  DataProductRepository(this.dataProductService);
  @override
  Future<List<ProductEntity>> fetchProducts() async{
    return await dataProductService.getData();
  }
  
}