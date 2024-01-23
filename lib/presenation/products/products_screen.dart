import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mytexnomart/presenation/products/products_screen_bloc.dart';

import '../../data/source/model/data/special_product_item_data.dart';
import '../../data/source/model/special_items/special_item_model.dart';
import '../../utils/hive_helper.dart';
import '../home/home_bloc.dart';
import '../product_detail_screen/product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  String slug;

  ProductScreen({
    Key? key,
    required this.slug,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final bloc = ProductsScreenBloc();

  @override
  void initState() {
    bloc.add(ProductScreenInitial());
    super.initState();
  }

  List<String> sliderImageList = [];
  List<String> sliderItemImages = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<ProductsScreenBloc, ProductsScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(body: Builder(builder: (context) {
            if (state.status == Status.Success) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 171,
                          child: ListView.builder(
                            itemCount: state.productsPopularCategory?.data
                                    .interestingProducts?.length ??
                                5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 10),
                                child: Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: SvgPicture.network(
                                              state
                                                      .productsPopularCategory
                                                      ?.data
                                                      .interestingProducts?[
                                                          index]
                                                      .image ??
                                                  'null',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        state
                                                .productsPopularCategory
                                                ?.data
                                                .interestingProducts?[index]
                                                .name ??
                                            'null',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                              mainAxisExtent: 330.0),
                      itemCount: state.productsPopularCategory?.data
                          .interestingProducts?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                          image: state
                                                  .productsPopularCategory
                                                  ?.data
                                                  .interestingProducts?[index]
                                                  ?.image ??
                                              " ",
                                          name: state
                                                  .productsPopularCategory
                                                  ?.data
                                                  .interestingProducts?[index]
                                                  ?.name ??
                                              " ",
                                          salePrice: state
                                                  .productsPopularCategory
                                                  ?.data
                                                  .interestingProducts?[index]
                                                  ?.salePrice ??
                                              0,
                                          priceMonth: state
                                                  .productsPopularCategory
                                                  ?.data
                                                  .interestingProducts?[index]!
                                                  .axiomMonthlyPrice ??
                                              "No data",
                                          code: state
                                                  .productsPopularCategory
                                                  ?.data
                                                  .interestingProducts?[index]!
                                                  .id ??
                                              0,
                                        )));
                          },
                          child: topProducts(state.productsPopularCategory?.data
                              .interestingProducts?[index]),
                        );
                      })
                ],
              );
            } else if (state.status == Status.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Scaffold();
            }
          }));
        },
      ),
    );
  }
}

Widget topProducts(SpecialProductItem? topProductsItem) {
  bool isFavourite = false;
  return BlocConsumer<HomeBloc, HomeState>(
    listener: (context, state) {},
    builder: (context, state) {
      return Container(
          height: 300,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    HiveHelper.addProductToFavourite(SpecialItemData(
                      image: topProductsItem?.image ?? "null",
                      name: topProductsItem?.name ?? "No data",
                      axiomMonthlyPrice:
                          topProductsItem?.axiomMonthlyPrice ?? "No data",
                      salePrice: topProductsItem?.salePrice.toString(),
                    ));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(topProductsItem?.image ?? "null"),
                  )),
              Text(
                topProductsItem?.name ?? "No data",
                style: const TextStyle(),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 160,
                child: Image.asset("assets/images/stars.png",
                    height: 20, fit: BoxFit.cover),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                alignment: Alignment.topLeft,
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:
                        Text(topProductsItem?.axiomMonthlyPrice ?? "No data"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Container(
                    alignment: Alignment.topLeft,
                    child:
                        Text('${topProductsItem?.salePrice.toString()} so`m')),
              )
            ],
          ));
    },
  );
}
