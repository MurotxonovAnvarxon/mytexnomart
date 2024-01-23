import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytexnomart/data/source/model/categories/all_categories_model.dart';

import '../../data/source/remote/api_client.dart';
import '../../di/di.dart';

part 'child_catalog_event.dart';

part 'child_catalog_state.dart';

class ChildCatalogBloc extends Bloc<ChildCatalogEvent, ChildCatalogState> {
  final apiClient = getIt<ApiClient>();

  ChildCatalogBloc() : super(ChildCatalogState()) {
    on<ChildCategoryEvent>((event, emit) async {
      emit(state.copyWith(statusChildCatalog: StatusChildCatalog.Loading));
      try {
        final getproductbycatalog =
            await apiClient.getAllCategories(slug: event.catalog);
        emit(state.copyWith(
            statusChildCatalog: StatusChildCatalog.Success,
            allCategoriesItemChild: getproductbycatalog));
      } catch (e) {
        emit(state.copyWith(statusChildCatalog: StatusChildCatalog.Loading));
      }
    });
  }
}
