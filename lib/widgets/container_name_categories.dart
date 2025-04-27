import 'package:flutter/material.dart';
import 'package:store_app/screens/get_category_screen.dart';

class ContainerNameCategories extends StatelessWidget {
  const ContainerNameCategories({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, GetCategoryScreen.id,
            arguments: categoryName);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 112, 105, 240),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 0)),
            ]),
        child: Text(
          categoryName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
