import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytexnomart/utils/hive_helper.dart';

import '../../data/source/model/data/special_product_item_data.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) async{
      final data = HiveHelper.getAllFavourites();
      emit(GetAllProductsFromFavouriteState(data.cast<SpecialItemData>()));
    });


    on<DeleteProductFromFavouriteEvent>((event, emit) async {
      HiveHelper.deleteProducts(event.product);
      final data = HiveHelper.getAllProducts();
      emit(GetAllProductsFromFavouriteState(data));
    });

  }
}
