import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? _productName, _description, _image, _price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    setState(() {
                      _productName = data;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Price',
                  onChanged: (data) {
                    setState(() {
                      _price = data;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data) {
                    setState(() {
                      _description = data;
                    });
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Submit',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await updateProduct(product);
                    setState(() {
                      isLoading = false;
                    });
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
    try {
      await UpdateProductService().updateProduct(
        id: product.id.toString(),
        title: _productName ?? product.title,
        description: _description ?? product.description,
        price: _price == null ? product.price.toString() : _price.toString(),
        image: _image ?? product.image,
        category: product.category,
      );
      Navigator.pop(context, AppRoutes.homePage);
    } catch (e) {
      print(e.toString());
    }
  }
}
