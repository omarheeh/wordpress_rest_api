import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordpress_rest_api/core/utils/api_serves.dart';
import 'package:wordpress_rest_api/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:wordpress_rest_api/feuters/home/data/home_repo/homer_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServes>(ApiServes(Dio()));

  getIt.registerSingleton<HomerRepoImpl>(HomerRepoImpl(getIt.get<ApiServes>()));

// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiServes>()));
}
