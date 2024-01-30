import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/source/model/categories/all_categories_model.dart';
import '../../data/source/model/detail_model/product_detail_model.dart';
import '../../data/source/model/sliders/slider_model.dart';
import '../../data/source/model/special/special_categories_model.dart';
import '../../data/source/model/special_items/special_item_model.dart';
import '../../data/source/remote/api_client.dart';
import '../../di/di.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final apiClient = getIt<ApiClient>();

  HomeBloc() : super(HomeState()) {
    on<HomeInitialEvent>((event, emit) async {
      emit(state.copyWith(status: Status.Loading));
      try {
        final slider = await apiClient.getSliders();
        final specialCategories = await apiClient.getTopCategories();
        final specialItems = await apiClient.getTopItem();
        final getAllCategory = await apiClient.getAllCategories();

        emit(
          state.copyWith(
            status: Status.Success,
            sliders: slider,
            specialItems: specialItems,
            categoriesModel: getAllCategory,
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: Status.Error));
      }
    });
    on<SpecialItemSelected>((event, emit) async {
      final getCharacters =
          await apiClient.getProductDetailById(event.id as int);
      emit(
        state.copyWith(status: Status.Success, productDetailModel: getCharacters),
      );
    });
  }
}
