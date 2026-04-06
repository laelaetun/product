import 'package:get_it/get_it.dart';
import 'package:product/application/api/apclient.dart';
import 'package:product/product/data/data_product_repository.dart';
import 'package:product/product/data/datasource/data_product_service.dart';
import 'package:product/product/domain/usecases/producr_usecase.dart';
import 'package:product/product/presentation/bloc/product_bloc.dart';

 final getIt=GetIt.instance;
class Injection {
 
 static Future<void> init() async{
  //service
  getIt.registerLazySingleton<ApiClient>(
    ()=>(ApiClient())
  );
  //datasource
  getIt.registerLazySingleton<DataProductService>(
    ()=> DataProductService(getIt<ApiClient>())
  );
  //repository
  getIt.registerLazySingleton<DataProductRepository>(
    ()=> DataProductRepository(getIt<DataProductService>())
  );
  //useCase
  getIt.registerLazySingleton<ProductUseCase>(
    ()=> ProductUseCase(getIt<DataProductRepository>())
  );
  //productBloc
  getIt.registerFactory<ProductBloc>(
    ()=> ProductBloc(getIt<ProductUseCase>())
  );


 }
}