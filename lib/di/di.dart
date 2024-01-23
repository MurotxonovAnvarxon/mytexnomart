import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mytexnomart/data/repository/app_repository.dart';
import 'package:mytexnomart/data/repository/app_repository_impl.dart';

import '../data/source/remote/api_client.dart';

final getIt = GetIt.instance;

final dio = Dio(
  BaseOptions(
      // baseUrl: 'https://gateway.texnomart.uz/api/web/v1/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: 'application/json',
      receiveDataWhenStatusError: true
  ),
);

void setup(){
  getIt.registerSingleton<ApiClient>(ApiClient(dio));
  getIt.registerSingleton<AppRepository>(AppRepositoryImpl());
}