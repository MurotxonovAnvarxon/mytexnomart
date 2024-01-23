import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytexnomart/data/source/model/categories/all_categories_model.dart';
import 'package:mytexnomart/data/source/remote/api_client.dart';

import '../../data/source/model/product_popular_category/products_popular_category.dart';
import '../../di/di.dart';
import '../home/home_bloc.dart';

part 'products_screen_event.dart';

part 'products_screen_state.dart';

class ProductsScreenBloc
    extends Bloc<ProductsScreenEvent, ProductsScreenState> {
  final apiClient = getIt<ApiClient>();

  ProductsScreenBloc() : super(const ProductsScreenState()) {
    on<ProductScreeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.Loading));
      try {
        final getProductByCatalog2 =
            await apiClient.getProductByCatalog2(slug: event.slug);
        emit(state.copyWith(
            status: Status.Success,
            productsPopularCategory: getProductByCatalog2));
      } catch (e) {
        emit(state.copyWith(status: Status.Loading));
      }
    });
  }
}
