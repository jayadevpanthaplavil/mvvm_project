import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      onViewModelReady: (model){
        model.init(context);
      },
      builder: (context, viewModel, child) {
        viewModel.init(context);
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff4f4f5e), Color(0xffa64444)])),
            child: Productlist(),
          ),

        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
class Productlist extends ViewModelWidget<HomeViewModel> {
  Productlist({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: viewModel.products!.length,
            itemBuilder: (context, index) {
              final product =  viewModel.products![index];
              return ListTile(
                title: Text('${product.title}'),
                subtitle: Text("${product.title}"),
                // Add more UI elements here to display product details
              );
            },
        ),
        );
    }}