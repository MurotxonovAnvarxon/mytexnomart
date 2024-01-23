part of 'products_screen_bloc.dart';

@immutable
class ProductsScreenState {
  final Status? status;
  final ProductsPopularCategory? productsPopularCategory;

  const ProductsScreenState({this.productsPopularCategory, this.status});

  ProductsScreenState copyWith(
          {Status? status, ProductsPopularCategory? productsPopularCategory}) =>
      ProductsScreenState(
          status: status ?? this.status,
          productsPopularCategory:
              productsPopularCategory ?? this.productsPopularCategory);
}
