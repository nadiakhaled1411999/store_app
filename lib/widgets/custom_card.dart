import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 15,
                spreadRadius: 5,
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 0)),
          ]),
          child: Card(
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 6),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$" "${product.price.toString()}"),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          top: -65,
          child: Image.network(
            product.image,
          ),
          height: 110,
          width: 110,
        ),
      ]),
    );
  }
}
