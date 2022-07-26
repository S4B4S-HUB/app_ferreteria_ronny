import 'dart:convert';

import 'package:app_ferreteria_ronny/config.dart';
import 'package:app_ferreteria_ronny/models/category.dart';
import 'package:app_ferreteria_ronny/models/product.dart';
import 'package:app_ferreteria_ronny/models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json'
    };

    Map<String, String> queryString = {
      'page' : page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);


      return categoriesFromJson(data["data"]);
    }
    else {
      return null;
    }
  }

   Future<List<Product>?> getProducts(ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json'
    };

    Map<String, String> queryString = {
      'page' : productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString()
    };

    if(productFilterModel.categoryId != null){
      queryString["categoryId"] = productFilterModel.categoryId!;
    }

    if(productFilterModel.sortBy != null) {
      queryString["sort"] = productFilterModel.sortBy!;
    }

    var url = Uri.http(Config.apiURL, Config.productAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);


      return productsFromJson(data["data"]);
    }
    else {
      return null;
    }
  }
}