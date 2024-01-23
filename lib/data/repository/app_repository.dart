



import '../source/model/stores/stores_model.dart';

abstract class AppRepository{

  Future<StoresModel> getStores();

}