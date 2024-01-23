import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mytexnomart/data/source/model/categories/all_categories_model.dart';
import 'package:mytexnomart/presenation/child_catalog_screen/child_catalog_bloc.dart';
import 'package:mytexnomart/presenation/product_detail_screen/product_detail_screen.dart';
import 'package:mytexnomart/presenation/products/products_screen.dart';

import '../../data/source/model/special_items/special_item_model.dart';
import '../../data/source/remote/api_client.dart';
import '../../di/di.dart';
import '../home/home_bloc.dart';

class ChildCatalogScreen extends StatefulWidget {
  final List<AllCategoriesItemChild> catalog;
  final String slug;

  const ChildCatalogScreen({
    Key? key,
    required this.catalog,
    required this.slug,
  }) : super(key: key);

  @override
  State<ChildCatalogScreen> createState() => _ChildCatalogScreenState();
}

class _ChildCatalogScreenState extends State<ChildCatalogScreen> {
  final bloc = ChildCatalogBloc();

  @override
  void initState() {
    //bloc.add(ChildCategoryEvent(widget.catalog));
    super.initState();
  }

  // final apiClient = getIt<ApiClient>();
  //
  // Future<AllCategoriesItemChild> getProductsByCatalog(String category) async {
  //   final response = await apiClient.getProductByCatalog(category);
  //
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<ChildCatalogBloc, ChildCatalogState>(
          listener: (context, state) {},
          builder: (context, state) {
            // if (state.statusChildCatalog == StatusChildCatalog.Loading) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ListView.builder(
                    itemCount: widget.catalog.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                      slug: widget.catalog[index].slug ?? "")));
                        },
                        child: Container(
                          height: 40,
                          child: Text("${widget.catalog[index].name}"),
                        ),
                      );
                    }),
              ),
            );
            // }
            // else {
            //   return const Scaffold(
            //       body: Center(child: CircularProgressIndicator()));
            // }
          },
        ));
  }
}
