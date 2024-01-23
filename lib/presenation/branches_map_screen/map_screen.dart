import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../bloc/map/map_list_bloc.dart';
import '../../data/source/remote/api_service.dart';
import '../../utils/app_lat_long.dart';
import '../../utils/location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapObjects = [];

  void getBranches() async {
    final result = await ApiService().getBranches();
    for (var element in result.data.data[0].openedStores) {
      mapObjects.add(PlacemarkMapObject(
          mapId: MapObjectId(element.id.toString()),
          text: const PlacemarkText(
              text: ""
              // element.name
              ,
              style: PlacemarkTextStyle(
                  size: 10, placement: TextStylePlacement.bottom)),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              scale: 0.1,
              image: BitmapDescriptor.fromAssetImage('assets/images/btn.png'))),
          point: Point(
              latitude: double.parse(element.lat),
              longitude: double.parse(element.long))));
    }
    // _moveToCurrentLocation(double.parse(result.data.data.first.openedStores.first.lat), double.parse(result.data.data.first.openedStores.first.long));
    /*setState(() {

    });*/
  }

  Future<void> _moveToCurrentLocation(double lat, double lon) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: lat,
            longitude: lon,
          ),
          zoom: 10,
        ),
      ),
    );
  }

  // Future<void> _initPermission() async {
  //   if (!await LocationService().checkPermission()) {
  //     await LocationService().requestPermission();
  //   }
  //   await _fetchCurrentLocation();
  // }
  //
  // Future<void> _fetchCurrentLocation() async {
  //   AppLatLong location;
  //   const defLocation = MoscowLocation();
  //   try {
  //     location = await LocationService().getCurrentLocation();
  //   } catch (_) {
  //     location = defLocation;
  //   }
  //   // _moveToCurrentLocation(location.lat,location.long);
  // }

  @override
  void initState() {
    _moveToCurrentLocation(41.2995, 69.2401);
    // _initPermission();
    // getBranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getBranches();
    setState(() {});

    final bloc = MapListBloc();
    return Scaffold(
        body: BlocProvider.value(
      value: bloc..add(GetAllMapListEvent()),
      child: BlocConsumer<MapListBloc, MapListState>(
        listener: (context, state) {
          if (state is GetAllMapListState) {
            state.data.data?.data?[0]!.openedStores?.forEach((element) {
              mapObjects.add(PlacemarkMapObject(
                  mapId: MapObjectId(element.id.toString()),
                  text: const PlacemarkText(
                      text: ""
                      // element.name
                      ,
                      style: PlacemarkTextStyle(
                          size: 10, placement: TextStylePlacement.bottom)),
                  icon: PlacemarkIcon.single(PlacemarkIconStyle(
                      scale: 0.1,
                      image: BitmapDescriptor.fromAssetImage(
                          'assets/images/btn.png'))),
                  point: Point(
                      latitude: double.parse(element.lat!),
                      longitude: double.parse(element.long!))));
            });
            // for (var element in state.data.data?.data?[0]!.openedStores) {
            //   print(
            //       "####################################################${element.name}");
            //   //print();
            //   mapObjects.add(PlacemarkMapObject(
            //       mapId: MapObjectId(element.id.toString()),
            //       text: const PlacemarkText(
            //           text: ""
            //           // element.name
            //           ,
            //           style: PlacemarkTextStyle(
            //               size: 10, placement: TextStylePlacement.bottom)),
            //       icon: PlacemarkIcon.single(PlacemarkIconStyle(
            //           scale: 0.1,
            //           image: BitmapDescriptor.fromAssetImage('assets/images/btn.png'))),
            //       point: Point(
            //           latitude: double.parse(element.lat),
            //           longitude: double.parse(element.long))));
            // }
          }
        },
        builder: (context, state) {
          return Builder(builder: (context) {
            return YandexMap(
                onMapCreated: (controller) {
                  mapControllerCompleter.complete(controller);
                },
                onMapTap: (point) {
                  print('LAT ----------------------');
                  print(point.latitude);
                },
                onObjectTap: (geoObject) {
                  print('NAMEEE -[-------------------');
                  print(geoObject.name);
                },
                zoomGesturesEnabled: true,
                mapObjects:
                    mapObjects /*[
                            PlacemarkMapObject(
                              onTap: (object, point) {
                  print('Object tappeppp');
                  print(object.mapId.value);
                              },
                              text: PlacemarkText(
                    text: "BUTTON", style: PlacemarkTextStyle(size: 12,placement: TextStylePlacement.bottom)),
                              mapId: MapObjectId('154'),
                              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    scale: 0.8,
                    image: BitmapDescriptor.fromAssetImage('assets/btn.png'))),
                              point: Point(latitude: 41.311081, longitude: 69.240562))

                          ],*/
                );
          });
        },
      ),
    ));
  }
}
