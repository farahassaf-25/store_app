import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shop,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
        title: const Text(
          'Store App',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 20),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    print(products[index]);
                    return CustomCard(product: products[index]);
                  });
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Center(child: Text("Error loading data"));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
