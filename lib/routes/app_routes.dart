import 'dart:js';

import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_product_page.dart';

class AppRoutes {
  static const String homePage = '/homePage';
  static const String updateProductPage = '/updateProductPage';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
    updateProductPage: (context) => UpdateProductPage(),
  };
}
