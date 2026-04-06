import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/application/di/injection.dart';
import 'package:product/product/presentation/bloc/product_bloc.dart';
import 'package:product/product/presentation/view/product_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<ProductBloc>(),
      child:MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Center(child: Text("Hello"),),
          backgroundColor: Colors.blue,
          ),
          body:const ProductPage(),
      )
    ));
    
  }
}