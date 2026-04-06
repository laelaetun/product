import 'package:bloc/bloc.dart';

import 'package:product/product/domain/entities/product_entity.dart';
import 'package:product/product/domain/usecases/producr_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;
  
  ProductBloc(this.productUseCase) : super(ProductInitial()) {
    on<ProductLoaded>((event, emit) async{
      emit(ProductLoading());
     final List<ProductEntity> result=await productUseCase.call();
     emit(ProductSuccess(result));
    });
  }
}
