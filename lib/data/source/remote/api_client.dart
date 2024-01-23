import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/categories/all_categories_model.dart';
import '../model/location/shops_location.dart';
import '../model/product_popular_category/products_popular_category.dart';
import '../model/sliders/slider_model.dart';
import '../model/special/special_categories_model.dart';
import '../model/special_items/special_item_model.dart';
import '../model/stores/stores_model.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('https://gateway.texnomart.uz/api/web/v1/category/catalog')
  Future<AllCategoriesModel> getAllCategories(
      {@Query('slug') String slug = ''});

  @GET('https://gateway.texnomart.uz/api/web/v1/content/sliders')
  Future<SliderModel> getSliders();

  @GET(
      'https://gateway.texnomart.uz/api/web/v1/home/special-products?type=hit_products')
  Future<SpecialItemModel> getTopItem();

  @GET('https://gateway.texnomart.uz/api/web/v1/home/special-categories')
  Future<SpecialModel> getTopCategories();

  @GET('https://gateway.texnomart.uz/api/common/v1/search/filters')
  Future<AllCategoriesItemChild> getProductByCatalog(
      @Query('slug') String category);

  @GET('https://gateway.texnomart.uz/api/web/v1/category/popular-categories')
  Future<ProductsPopularCategory> getProductByCatalog2(
      {@Query('slug') String slug = 'smartfony'});

  @GET('https://gateway.texnomart.uz/api/web/v1/region/stores-list')
  Future<ShopsMapModel> getShopsLocation();

  @GET('https://gateway.texnomart.uz/api/web/v1/region/stores-list')
  Future<StoresModel> getStoresModel();
}
