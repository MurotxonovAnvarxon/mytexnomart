import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytexnomart/data/source/model/data/special_product_item_data.dart';
import 'package:mytexnomart/data/source/model/special/special_categories_model.dart';
import 'package:mytexnomart/data/source/model/special_items/special_item_model.dart';
import 'package:mytexnomart/presenation/product_detail_screen/product_detail_screen.dart';
import 'package:mytexnomart/utils/hive_helper.dart';
import '../../utils/slider.dart';
import '../catalog_screen/catalog_screen.dart';
import '../child_catalog_screen/child_catalog_screen.dart';
import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();

  @override
  void initState() {
    bloc.add(HomeInitialEvent());
    super.initState();
  }

  List<String> sliderImageList = [];
  List<String> sliderItemImages = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(body: Builder(builder: (context) {
            if (state.status == Status.Success) {
              sliderImageList = state.sliders?.data?.data
                      ?.map((i) => i?.imageMobileWeb ?? "")
                      .toList() ??
                  [];
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF8BF1C),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(23))),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'texnomart*',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20),
                                child: SizedBox(
                                  height: 40,
                                  child: TextField(
                                    cursorColor: Colors.orangeAccent,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        suffixIcon: InkWell(
                                            child: Icon(Icons.keyboard_voice)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Men sotib olmoqchiman"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        ImageSliderDemo(imgList: sliderImageList),
                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            //   CatalogScreen()
                            // ));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(),
                                Text("All"),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 171,
                          child: ListView.builder(
                            itemCount: state
                                    .categoriesModel?.data.categories?.length ??
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
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChildCatalogScreen(
                                                          catalog: state
                                                                  .categoriesModel
                                                                  ?.data
                                                                  .categories![
                                                                      index]
                                                                  .childs ??
                                                              [],
                                                          slug: state
                                                                  .categoriesModel
                                                                  ?.data
                                                                  .categories![
                                                                      index]
                                                                  .slug ??
                                                              " ",
                                                        )));
                                          },
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: SvgPicture.network(
                                                state
                                                        .categoriesModel
                                                        ?.data
                                                        .categories?[index]
                                                        .smallImage ??
                                                    'null',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        state.categoriesModel?.data
                                                .categories?[index].name ??
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
                      itemCount: state.specialItems?.data?.data?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                          image: state.specialItems?.data
                                                  ?.data![index]?.image ??
                                              " ",
                                          name: state.specialItems?.data
                                                  ?.data![index]?.name ??
                                              " ",
                                          salePrice: state.specialItems?.data
                                                  ?.data![index]?.salePrice ??
                                              0,
                                          priceMonth: state
                                                  .specialItems
                                                  ?.data
                                                  ?.data![index]!
                                                  .axiomMonthlyPrice ??
                                              "No data",
                                          code: state.specialItems?.data
                                                  ?.data![index]!.id ??
                                              0,
                                        )));
                          },
                          child: topProducts(
                              state.specialItems?.data?.data?[index]),
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
