import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../bloc/stores/stores_bloc.dart';
import '../../data/source/model/allbranches/model.dart';
import '../../data/source/model/location/shops_location.dart';
import '../home/home_bloc.dart';
import '../one_branch_map_screen/shops_location_screen.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elements = [];
    final bloc = StoresBloc();
    bloc.add(StoresInitialEvent());
    return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<StoresBloc, StoresState>(
          builder: (context, state) {
            if (state.status == Status.Loading) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amberAccent,
                  title: const Text(
                    'Do`konlar',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "allbranchesscreen");
                        },
                        child: Icon(Icons.map_rounded))
                  ],
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amberAccent,
                  title: const Text(
                    'Do`konlar',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "allbranchesscreen");
                          },
                          child: Icon(Icons.map_rounded)),
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFF7F7F9)),
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 8, right: 16, left: 16),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search_sharp,
                                color: Colors.grey,
                                size: 24,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Manzil',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Spacer(),
                              Icon(
                                Icons.mic_rounded,
                                color: Colors.grey,
                                size: 24,
                              )
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: GroupedListView<dynamic, String>(
                            elements: elements,
                            groupBy: (element) => element['group'],
                            groupSeparatorBuilder: (value) => Container(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 10, bottom: 10),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                            useStickyGroupSeparators: true,
                            itemBuilder: (context, element) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShopsLocationPage(
                                                data: OpenedStores(
                                                    0,
                                                    element['name'],
                                                    element['address'],
                                                    '',
                                                    element['lang'],
                                                    element['lat'],
                                                    element['phone'],
                                                    element['date'], []),
                                              )));
                                  // Navigator.push(
                                  //     context,
                                  //     PageRouteBuilder(
                                  //         pageBuilder: (context, animation,
                                  //                 secondaryAnimation) =>
                                  //             ShopsLocationPage(
                                  //                 maps: [
                                  //                       OpenedStore(
                                  //                           0,
                                  //                           element['name'],
                                  //                           element['address'],
                                  //                           '',
                                  //                           element['lang'],
                                  //                           element['lat'],
                                  //                           element['phone'],
                                  //                           element['date'], [])
                                  //                     ] ??
                                  //                     [],
                                  //                 index: 0)));
                                },
                                child: location_item2(element),
                              );
                            })),
                    // Expanded(
                    //   child: Container(
                    //     height: 56,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //             color: Color(0xFFBBBBB7),
                    //             borderRadius: BorderRadius.circular(15)),
                    //         child: Center(
                    //           child: Text(
                    //             'Eng yaqin joyni ko`rish',
                    //             style: TextStyle(
                    //                 fontSize: 16, fontWeight: FontWeight.w600),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              );
            }
          },
          listener: (context, state) {
            var size = state.storesModel?.data?.data?.length ?? 2;

            for (int i = 0; i < size; i++) {
              var jSize =
                  state.storesModel?.data?.data?[i].openedStores?.length ?? 1;
              if (state.storesModel?.data?.data?[i].name != null &&
                  state.storesModel?.data?.data?[i].name != 'Barchasi') {
                for (int j = 0; j < jSize; j++) {
                  elements.add({
                    'group': '${state.storesModel?.data?.data?[i].name}',
                    'name':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].name}',
                    'address':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].address}',
                    'lat':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].lat}',
                    'lang':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].long}',
                    'date':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].workTime}',
                    'phone':
                        '${state.storesModel?.data?.data?[i].openedStores?[j].phone}',
                  });
                }
              }
            }
          },
        ));
  }

  Container location_item2(element) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(left: 8, right: 12, top: 12),
      child: Column(
        children: [
          Row(
            children: [
              //SvgPicture.network(state.allCategoriesModel?.data?.categories?[index].smallImage ?? "null"),
              Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/ic_location.png',
                    height: 32,
                    width: 32,
                  )),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 300,
                      child: Text(
                        element['address'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Text(
                    element['date'],
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
