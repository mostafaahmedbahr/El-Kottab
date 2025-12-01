
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
 import '../../../features/complete_register/data/repos/complete_register_repos_imple.dart';
import '../../../features/login/data/repos/login_repo_imple.dart';
import '../../../features/otp/data/repos/otp_repo_imple.dart';
import '../../../features/register/data/repos/register_repos_imple.dart';
import 'api_service.dart';


final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<OtpRepoImpl>(OtpRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CompleteRegisterRepoImpl>(CompleteRegisterRepoImpl(
    getIt.get<ApiService>(),
  ));
}