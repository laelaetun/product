import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/product/presentation/bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductLoaded());
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc,ProductState>(
      builder:(context,state){
        if(state is ProductLoading ){
          return const CircularProgressIndicator();
        }
        else if(state is ProductSuccess){
          // final index=state.product.length;
          // print("data :: $index");
          // return Text(index.toString()); 
          return ListView.builder(
            itemCount: state.product.length,
            itemBuilder: (context,index){
              final indexs=state.product[index];
              return ListTile(
                title: Text(indexs.title),
              );
            });
        }
        return const SizedBox.shrink();
      } );
  }
}