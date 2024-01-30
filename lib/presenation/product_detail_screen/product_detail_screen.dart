import 'dart:ffi';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/source/model/data/special_product_item_data.dart';
import '../../utils/hive_helper.dart';
import '../detail_feature/detail_feature_screen.dart';
import '../home/home_bloc.dart';
import 'characters_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final int salePrice;
  final String priceMonth;
  final int code;

  const ProductDetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.salePrice,
    required this.priceMonth,
    required this.code,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final bloc = HomeBloc();

  @override
  void initState() {
    bloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFFF8BF1C)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0, left: 15),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "main");
                            },
                            child: const Icon(Icons.arrow_back)),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.file_upload_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                            "assets/images/scale.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 28.0),
                          child: Icon(Icons.favorite_border),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child:
                      SizedBox(height: 170, child: Image.network(widget.image)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Mavjud",
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Spacer(),
                      Text("Kod: ${widget.code}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 18),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${widget.salePrice.toString()}  so'm",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      )),
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 18),
                    child: Card(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 60.0),
                              child: Text(
                                "Muddatli to'lov",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                widget.priceMonth,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Sharhlar: 9",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 14)),
                          Spacer(),
                          Image.asset("assets/images/stars.png",
                              fit: BoxFit.cover, width: 100),
                          Icon(Icons.arrow_forward_ios, color: Colors.black38)
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.black12),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Filiallar",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 14)),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Colors.black38)
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.black12),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharactersScreen(
                                    characters: state.productDetailModel?.data.data.characters ??[],
                                  )));
print("************************************************************************${state.productDetailModel?.data.data.characters?[0]}");
                        },
                        child: Row(
                          children: [
                            Text("Xususiyatlari",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14)),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, color: Colors.black38)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 18.0, right: 320),
                //   child: Text(
                //     "Rang",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                //   ),
                // ),
                // Container(
                //   width: 70,
                //   height: 90,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(10))),
                // ),
                InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 88, left: 8.0, right: 8),
                    child: InkWell(
                      onTap: () {
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,

                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: "Savatchaga qo'shildi!",
                            // message:
                            // 'This is an example error message that will be shown in the body of snackbar!',

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.success,
                            message: '',
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);

                        HiveHelper.addProductToBasket(SpecialItemData(
                          image: widget?.image ?? "null",
                          name: widget?.name ?? "No data",
                          axiomMonthlyPrice: "No data",
                          salePrice: widget?.salePrice.toString(),
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFffc300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            'Savatchaga',
                            textAlign: TextAlign.center,
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container colors_item() {
    return Container(
      width: 70,
      height: 90,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
