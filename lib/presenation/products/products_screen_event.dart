part of 'products_screen_bloc.dart';

@immutable
abstract class ProductsScreenEvent {}

class ProductScreenInitial extends ProductsScreenEvent {}

class ProductScreeEvent extends ProductsScreenEvent {
  String slug;

  ProductScreeEvent(this.slug);
}
