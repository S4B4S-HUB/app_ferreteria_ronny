import 'package:app_ferreteria_ronny/models/category.dart';
import 'package:app_ferreteria_ronny/models/pagination.dart';
import 'package:app_ferreteria_ronny/models/product.dart';
import 'package:app_ferreteria_ronny/models/product_filter.dart';
import 'package:app_ferreteria_ronny/providers.dart';
import 'package:app_ferreteria_ronny/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);

    list.add(Product(
        productName: "Candado 40mm Marino arco normal Fac",
        category: Category(
            categoryName: "Cerrajería",
            categoryImage: "/uploads/categories/1658001411765-cerrajeria_r.png",
            categoryId: "62d31803dd63be5c5ecc75fc"),
        productShortDescription:
            "Cerradura suelta contenida en una caja de metal, que por medio de armellas asegura puertas, ventanas, tapas de cofres, maletas, etc.",
        productPrice: 50,
        productSalePrice: 58,
        productImage:
            "/uploads/products/1658013499086-Candado40mmMarinoarconormalFac.png",
        productSKU: "simple",
        productType: "simple",
        stockStatus: "IN",
        productId: "62d3473b7daa8b38027f6067"));
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 15),
              child: Text("Mejores 10 productos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _productList(ref),
        )
      ]),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      homeProductProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );

    return products.when(
      data: (list) {
        return _buildProductList(list!);
      },
      error: (_, __) {
        return const Center(child: Text("ERROR"));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(
              model: data,
            ),
          );
        },
      ),
    );
  }
}
