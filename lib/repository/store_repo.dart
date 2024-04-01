// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc_app/model/store_model.dart';
import 'package:bloc_app/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class StoreRepo {
  Future<List<StoreModel>> getProductData() async {
    List<StoreModel> productList = [];
    try {
      var response = await http.get(Uri.parse(AppStrings.productEndpoint));
      if (response.statusCode == 200) {
        final respBody = jsonDecode(response.body) ?? [];
        respBody.forEach((elem) => productList.add(StoreModel.fromJson(elem)));
      }

      return productList;
    } catch (e) {
      print('Error at Repo Level in getProductData : $e ');
      print(StackTrace.current);
      return productList;
    }
  }
}
