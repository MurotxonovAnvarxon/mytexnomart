import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mytexnomart/presenation/catalog_screen/catalog_screen.dart';
import 'package:mytexnomart/presenation/favourite_page/favourite_page.dart';
import 'package:mytexnomart/presenation/home/home_screen.dart';
import 'package:mytexnomart/presenation/orders_screen/order_screen.dart';
import 'package:mytexnomart/presenation/product_detail_screen/product_detail_screen.dart';
import 'package:mytexnomart/presenation/profil_screen/profil_screen.dart';

import '../basket_screen/basket_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  final List<Widget> screens = [
    const HomeScreen(),
    const CatalogScreen(),
    const BasketPage(),
    const OrderScreen(),
    const ProfilScreen(),
    // const ProductDetailScreen(image: "image", name: "name", salePrice: 0),
    const FavouritePage()
  ];

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        height: 64,
        child: Container(
          height: 46,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[0];
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/home.png",
                        height: 24,
                        width: 24,
                        color: currentTab == 0
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D)),
                    const SizedBox(height: 3),
                    Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: currentTab == 0
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[1];
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/search.png",
                        height: 24,
                        width: 24,
                        color: currentTab == 1
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D)),
                    const SizedBox(height: 3),
                    Text(
                      'Katalog',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: currentTab == 1
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[2];
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/cart.png",
                        height: 24,
                        width: 24,
                        color: currentTab == 2
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D)),
                    const SizedBox(height: 3),
                    Text(
                      'Savatcha',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: currentTab == 2
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[3];
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/box.png",
                        height: 24,
                        width: 24,
                        color: currentTab == 3
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D)),
                    const SizedBox(height: 3),
                    Text(
                      'Buyurtmalar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: currentTab == 3
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 30,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[4];
                    currentTab = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/profil.png",
                        height: 24,
                        width: 24,
                        color: currentTab == 4
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D)),
                    const SizedBox(height: 3),
                    Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: currentTab == 4
                            ? const Color(0xFFF26B6C)
                            : const Color(0xFF7D7D7D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
