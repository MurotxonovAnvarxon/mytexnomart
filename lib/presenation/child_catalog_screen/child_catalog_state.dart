part of 'child_catalog_bloc.dart';

@immutable
class ChildCatalogState {
  final StatusChildCatalog? statusChildCatalog;
  final AllCategoriesModel? childCategories;

  ChildCatalogState({this.childCategories, this.statusChildCatalog});

  ChildCatalogState copyWith(
          {StatusChildCatalog? statusChildCatalog,
            AllCategoriesModel? allCategoriesItemChild}) =>
      ChildCatalogState(
          statusChildCatalog: statusChildCatalog ?? this.statusChildCatalog,
          childCategories: allCategoriesItemChild ?? this.childCategories);
}

enum StatusChildCatalog { Loading, Success, Error, Initial }
