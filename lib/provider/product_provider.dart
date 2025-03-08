import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  int _page = 1;
  bool _loading = false;
  Map<String, dynamic>? _productData;
  List<dynamic> _productList = [];

  List<dynamic> get productList => _productList;
  bool get loading => _loading;
  late Dio dio;

  ProductProvider() {
    dio = Dio();
    scrollController.addListener(_scrollListener);
    getUsers();
  }

  Map<String, dynamic>? get productData => _productData;

  Future<void> getUsers() async {
    if (_loading) return;
    _loading = true;
    notifyListeners();
    try {
      final response = await dio.get(
        "https://api.alisuq.com/api/v2/customer/variants?country_id=1&page=$_page&records_per_page=20&product_type=retail",
      );

      if (response.statusCode == 200) {
        final newUserModel = response.data;
        _page++;

        if (_productData == null) {
          _productData = newUserModel;
          _productList = _productData?['products'] ?? [];
        } else {
          _productList.addAll(newUserModel['products']);
        }

        if (_page > newUserModel['pagination']['total_pages']) {
          return;
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getUsers();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
