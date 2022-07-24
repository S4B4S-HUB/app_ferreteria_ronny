import 'package:app_ferreteria_ronny/models/category.dart';
import 'package:app_ferreteria_ronny/models/product.dart';
import 'package:app_ferreteria_ronny/widgets/product_card.dart';
import 'package:app_ferreteria_ronny/widgets/widget_home_categories.dart';
import 'package:app_ferreteria_ronny/widgets/widget_home_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    Product model;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const HomeCategoriesWidget(), 
            const HomeProductsWidget()
          ],
        ),
      ),
    );
  }
}

