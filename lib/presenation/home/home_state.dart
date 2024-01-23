part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final SpecialModel? specialCategories;
  final SpecialItemModel? specialItems;
  final SliderModel? sliders;
  final AllCategoriesModel? categoriesModel;
  final AllCategoriesItemChild? childCategories;

  HomeState(
      {this.status,
      this.specialCategories,
      this.specialItems,
      this.sliders,
      this.categoriesModel,
      this.childCategories});

  HomeState copyWith(
          {Status? status,
          SpecialModel? specialCategories,
          SpecialItemModel? specialItems,
          AllCategoriesModel? categoriesModel,
          SliderModel? sliders,
          AllCategoriesItemChild ? categoriesItemChild
          }) =>
      HomeState(
          status: status ?? this.status,
          specialCategories: specialCategories ?? this.specialCategories,
          specialItems: specialItems ?? this.specialItems,
          categoriesModel: categoriesModel ?? this.categoriesModel,
          childCategories: childCategories ?? this.childCategories,
          sliders: sliders ?? this.sliders);
}

enum Status { Loading, Success, Error, Initial }
