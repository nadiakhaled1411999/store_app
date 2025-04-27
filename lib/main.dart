import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product_screen.dart';
import 'package:store_app/screens/all_categories_screen.dart';
import 'package:store_app/screens/get_category_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
HomeScreen.id:(context)=>const HomeScreen(),
UpdateProductScreen.id:(context)=>  UpdateProductScreen(),
AddProductScreen.id:(context)=> AddProductScreen(),
AllCategoriesScreen.id:(context)=>AllCategoriesScreen(),
GetCategoryScreen.id:(context)=>GetCategoryScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
