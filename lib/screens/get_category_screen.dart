import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import 'package:store_app/services/get_category_service.dart';
import 'package:store_app/widgets/container_name_categories.dart';
import 'package:store_app/widgets/custom_card.dart';

class GetCategoryScreen extends StatelessWidget {
  const GetCategoryScreen({super.key});
  static String id = "GetCategoryScreen";

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          " $categoryName",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
        child: FutureBuilder<List<ProductModel>>(
            future:
                GetCategoryService().getCategory(categoryName: categoryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> productList = snapshot.data!;
                return GridView.builder(
                  itemCount: productList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: productList[index],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error:${snapshot.error}"),
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
