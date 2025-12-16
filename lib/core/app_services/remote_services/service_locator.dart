
import 'package:dio/dio.dart';
import 'package:el_kottab/features/free_learning/data/repos/free_learning_repo_imple.dart';
import 'package:get_it/get_it.dart';
 import '../../../features/balance/data/repos/balance_repo_imple.dart';
import '../../../features/chat/data/repos/chat_repo_imple.dart';
 import '../../../features/home/data/repos/home_repo_imple.dart';
import '../../../features/login/data/repos/login_repo_imple.dart';
import '../../../features/notifications/data/repos/notifications_repo_imple.dart';
import '../../../features/otp/data/repos/otp_repo_imple.dart';
import '../../../features/packages/data/repos/packages_repo_imple.dart';
import '../../../features/profile/data/repos/profile_repo_imple.dart';
import '../../../features/register/data/repos/register_repos_imple.dart';
import '../../../features/sessions/data/repos/sessions_repo_imple.dart';
import '../../../features/teacher_details/data/repos/teacher_details_repo_imple.dart';
import '../../../features/teachers/data/repos/teachers_repo_imple.dart';
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
  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<TeachersRepoImpl>(TeachersRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<TeacherDetailsRepoImpl>(TeacherDetailsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<SessionsRepoImpl>(SessionsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<BalanceRepoImpl>(BalanceRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<FreeLearningRepoImpl>(FreeLearningRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<PackagesRepoImpl>(PackagesRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ChatRepoImpl>(ChatRepoImpl(
    getIt.get<ApiService>(),
  ));

}