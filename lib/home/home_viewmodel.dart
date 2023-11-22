




import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/web/apiservice.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../model/Products.dart';


class HomeViewModel extends BaseViewModel {
  List<Products>_products=[];

  List<Products> get products => _products;
  var apiService;
  init(BuildContext context) async {
    apiService=ApiService();
    var data=await apiService.fetchProducts();
    print("count:${data.length}");
    _products=data;
    notifyListeners();
  }

}
