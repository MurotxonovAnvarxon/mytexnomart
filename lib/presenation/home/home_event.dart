part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}

class SpecialItemSelected extends HomeEvent {
  SpecialProductItem itemSelected;

  SpecialItemSelected(this.itemSelected);
}

class SpecialCategorySelected extends HomeEvent {
  SpecialItem specialCategory;

  SpecialCategorySelected(this.specialCategory);
}
