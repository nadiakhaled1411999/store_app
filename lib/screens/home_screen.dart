import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/add_product_screen.dart';
import 'package:store_app/screens/all_categories_screen.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            onTap: (index) {
              print(index);
              if (index == 0) {
                Navigator.pushNamed(context, HomeScreen.id);
              } else if (index == 1) {
                Navigator.pushNamed(context, AddProductScreen.id);
              } else {
                Navigator.pushNamed(context, AllCategoriesScreen.id);
              }
            },
            items: const [
              Icon(Icons.home),
              Icon(Icons.add),
              Icon(FontAwesomeIcons.bagShopping),
            ]),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back),
              Text("New Trend"),
              Icon(FontAwesomeIcons.cartPlus),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 75),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) {
                          return CustomCard(
                            product: products[index],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
