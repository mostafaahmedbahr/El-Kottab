import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/register/data/repos/register_repos.dart';

import '../../../../core/app_services/remote_services/api_service.dart';
import 'complete_register_repos.dart';



class CompleteRegisterRepoImpl implements CompleteRegisterRepo {
  final ApiService? apiService;
  CompleteRegisterRepoImpl(this.apiService);

  // @override
  // Future<Either<Failure, RegisterModel>> register({required FormData data}) async {
  //   try {
  //     final response = await apiService!.postData(
  //       endPoint: EndPoints.register,
  //       data: data,
  //       isMultipart: true,
  //     );
  //     final result = RegisterModel.fromJson(response.data);
  //     return right(result);
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }







}