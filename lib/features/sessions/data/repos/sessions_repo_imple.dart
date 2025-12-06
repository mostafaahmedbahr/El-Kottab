import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/sessions/data/repos/sessions_repo.dart';
import '../../../../main_imports.dart';




class SessionsRepoImpl implements SessionsRepo {
  final ApiService? apiService;

  SessionsRepoImpl(this.apiService);


  // @override
  // Future<Either<Failure, LoginModel>> login({required String email , required String password}) async{
  //   try {
  //     var data = FormData.fromMap({
  //       'email': email,
  //       'password': password
  //     });
  //     var response = await apiService!.postData(
  //       endPoint: EndPoints.login,
  //       data: data,
  //     );
  //     LoginModel result = LoginModel.fromJson(response.data);
  //     return right(result);
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }
  //

}

