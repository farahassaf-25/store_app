import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/routes/app_routes.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}
