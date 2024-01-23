

import '../../di/di.dart';
import '../source/model/stores/stores_model.dart';
import '../source/remote/api_client.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository{
  final api = getIt<ApiClient>();



  @override
  Future<StoresModel> getStores() async{
    final response = await api.getStoresModel();
    return response;
  }

}