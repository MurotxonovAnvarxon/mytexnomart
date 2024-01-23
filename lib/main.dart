import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytexnomart/data/source/model/location/shops_location.dart';
import 'package:mytexnomart/presenation/basket_screen/basket_page.dart';
import 'package:mytexnomart/presenation/branches_list/map_list_page.dart';
import 'package:mytexnomart/presenation/branches_map_screen/map_screen.dart';
import 'package:mytexnomart/presenation/catalog_screen/catalog_screen.dart';
import 'package:mytexnomart/presenation/child_catalog_screen/child_catalog_screen.dart';
import 'package:mytexnomart/presenation/favourite_page/favourite_page.dart';
import 'package:mytexnomart/presenation/home/home_screen.dart';
import 'package:mytexnomart/presenation/main_screen/main_screen.dart';
import 'package:mytexnomart/presenation/orders_screen/order_screen.dart';
import 'package:mytexnomart/presenation/product_detail_screen/product_detail_screen.dart';
import 'package:mytexnomart/presenation/profil_screen/profil_screen.dart';
import 'package:mytexnomart/presenation/branches_list/stores_screen.dart';
import 'package:mytexnomart/utils/hive_helper.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'data/source/model/allbranches/model.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFF8BF1C),
  ));
  AndroidYandexMap.useAndroidViewSurface = false;
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "main",
      routes: {
        "home": (context) => const HomeScreen(),
        "main": (context) => const MainScreen(),
        "catalog": (context) => const CatalogScreen(),
        "cart": (context) => const BasketPage(),
        "order": (context) => const OrderScreen(),
        "profil": (context) => const ProfilScreen(),
        "favourite": (context) => const FavouritePage(),
        "maplistpage": (context) => const MapListPage(),
        "allbranchesscreen": (context) => const MapScreen(),
        "storesScreen": (context) => const StoresScreen()
        // "productdetail":(context)=>const ProductDetailScreen()
      },
    );
  }
}
