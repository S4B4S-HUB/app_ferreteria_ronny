import 'package:app_ferreteria_ronny/models/pagination.dart';
import 'package:app_ferreteria_ronny/models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsFilterNotifier extends StateNotifier<ProductFilterModel> {
  ProductsFilterNotifier()
      : super(
          ProductFilterModel(
            paginationModel: PaginationModel(
              page: 0,
              pageSize: 10,
            ),
          ),
        );

      void setProductFilter(ProductFilterModel model) {
        state = model;
      }  
}
