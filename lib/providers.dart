import 'package:app_ferreteria_ronny/api/api_service.dart';
import 'package:app_ferreteria_ronny/application/notifier/product_filter_notifier.dart';
import 'package:app_ferreteria_ronny/application/state/product_state.dart';
import 'package:app_ferreteria_ronny/models/category.dart';
import 'package:app_ferreteria_ronny/models/pagination.dart';
import 'package:app_ferreteria_ronny/models/product.dart';
import 'package:app_ferreteria_ronny/models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/notifier/product_notifier.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, productFilterModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getProducts(productFilterModel);
  },
);

final productsFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>(
  (ref) => ProductsFilterNotifier(),
);


final productsNotifierProvider = 
  StateNotifierProvider<ProductsNotifier, ProductsState>(
    (ref) => ProductsNotifier(
      ref.watch(apiService),
      ref.watch(productsFilterProvider)
    ),
  );