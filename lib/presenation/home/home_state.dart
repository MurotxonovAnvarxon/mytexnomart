part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final SpecialModel? specialCategories;
  final SpecialItemModel? specialItems;
  final SliderModel? sliders;
  final AllCategoriesModel? categoriesModel;
  final AllCategoriesItemChild? childCategories;
  final ProductDetailModel? productDetailModel;

  HomeState(
      {this.status,
      this.specialCategories,
      this.specialItems,
      this.sliders,
      this.categoriesModel,
      this.childCategories,
      this.productDetailModel});

  HomeState copyWith(
          {Status? status,
          SpecialModel? specialCategories,
          SpecialItemModel? specialItems,
          AllCategoriesModel? categoriesModel,
          SliderModel? sliders,
          AllCategoriesItemChild? categoriesItemChild,
            ProductDetailModel? productDetailModel}) =>
      HomeState(
          status: status ?? this.status,
          specialCategories: specialCategories ?? this.specialCategories,
          specialItems: specialItems ?? this.specialItems,
          categoriesModel: categoriesModel ?? this.categoriesModel,
          childCategories: childCategories ?? this.childCategories,
          sliders: sliders ?? this.sliders,
          productDetailModel: productDetailModel ?? this.productDetailModel);
}

enum Status { Loading, Success, Error, Initial }
