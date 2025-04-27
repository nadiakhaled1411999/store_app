import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product.dart';

import 'package:store_app/widgets/app_text_button.dart';
import 'package:store_app/widgets/app_text_filed.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static String id = "add Product Screen";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? productName, desc, image, category, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "AddProduct",
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
                  height: 20,
                ),
                AppTextFiled(
                  onChanged: (data) {
                    category = data;
                  },
                  hintText: "category",
                ),
                const SizedBox(
                  height: 40,
                ),
                AppTextButton(
                  text: "Add product",
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await addProduct();
                      print("success");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Center(child: Text("Added product SuccessfULLY")),
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

  Future<void> addProduct() async {
    await AddProduct().addProduct(
      title: productName!,
      price: price!,
      desc: desc !,
      image: image!,
      category: category!,
    );
  }
}
