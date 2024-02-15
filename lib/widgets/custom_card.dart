import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/routes/app_routes.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.updateProductPage,
            arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 0,
              offset: const Offset(5, 5),
            )
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(product.title.substring(0, 6)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$' '${product.price.toString()}'),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 200,
          child: Image.network(product.image, width: 100, height: 100),
        ),
      ]),
    );
  }
}
