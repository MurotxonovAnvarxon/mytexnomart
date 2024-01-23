part of 'child_catalog_bloc.dart';

@immutable
abstract class ChildCatalogEvent {}


class ChildCategorielInitial extends ChildCatalogEvent{

}

class ChildCategoryEvent extends ChildCatalogEvent{
  String catalog;

  ChildCategoryEvent(this.catalog);
}


