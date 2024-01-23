import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mytexnomart/presenation/child_catalog_screen/child_catalog_screen.dart';
import 'package:mytexnomart/presenation/home/home_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
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
          if (state.status == Status.Success) {
            return Scaffold(
              body: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70.0, left: 20, right: 20),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        cursorColor: Colors.orangeAccent,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon:
                                InkWell(child: Icon(Icons.keyboard_voice)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Men sotib olmoqchiman"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount:
                          state.categoriesModel?.data.categories?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChildCatalogScreen(
                                          catalog: state.categoriesModel?.data
                                                  .categories![index].childs ??
                                              [],
                                          slug: state.categoriesModel?.data
                                                  .categories![index].slug ??
                                              " ",
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Row(
                              children: [
                                SvgPicture.network(
                                  state.categoriesModel?.data.categories?[index]
                                          .smallImage ??
                                      'null',
                                ),
                                Text(
                                  state.categoriesModel?.data.categories?[index]
                                          .name ??
                                      'null',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
