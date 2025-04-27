import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/app_text_button.dart';
import 'package:store_app/widgets/app_text_filed.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = "Update Product Screen";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, category, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "UpdateProduct",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 120),
            child: Column(
              children: [
                AppTextFiled(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "Product Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFiled(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: "price",
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFiled(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "description",
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFiled(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "image",
                ),
                const SizedBox(
                  height: 40,
                ),
                AppTextButton(
                  text: "Update",
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("success");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Center(child: Text("Updated SuccessfULLY")),
                            backgroundColor:
                                Color.fromARGB(255, 112, 105, 240)),
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      desc: desc ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
