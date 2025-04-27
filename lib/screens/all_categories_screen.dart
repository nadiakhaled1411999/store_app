import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';
import 'package:store_app/widgets/container_name_categories.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});
  static String id = "AllCategoriesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "all categories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
        child: FutureBuilder<List<dynamic>>(
            future: AllCategoriesService().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> categories = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ContainerNameCategories(
                        categoryName: categories[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error:${snapshot.error}"),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
