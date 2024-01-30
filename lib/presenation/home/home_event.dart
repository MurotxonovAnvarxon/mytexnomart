part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class SpecialItemSelected extends HomeEvent {
  SpecialProductItem itemSelected;
  String id;

  SpecialItemSelected(this.itemSelected, this.id);
}

class SpecialCategorySelected extends HomeEvent {
  SpecialItem specialCategory;
  String id;

  SpecialCategorySelected(this.specialCategory,this.id);
}
