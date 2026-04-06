import 'package:product/product/domain/entities/product_entity.dart';

class DataProductModel extends ProductEntity {
  DataProductModel({
    required super.id,
    required super.title,
  });

  factory DataProductModel.fromJson(Map<String,dynamic> json){
    return DataProductModel(id: json['id'], title: json['title']);
  }
  
}