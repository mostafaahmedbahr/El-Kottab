 import 'package:dartz/dartz.dart';
import 'package:el_kottab/core/app_services/remote_services/api_service.dart';
 import '../models/resend_otp_model.dart';
import '../models/verify_otp_model.dart';
import 'otp_repo.dart';


class OtpRepoImpl implements OtpRepo {
  final ApiService? apiService;

  OtpRepoImpl(this.apiService);


  // @override
  // Future<Either<Failure, VerifyOtpModel>> verifyOtp({
  //   required String otpCode,
  // }) async{
  //   try {
  //     // استخدام FormData مثل Postman تماماً
  //     var formData = FormData.fromMap({
  //       'code': otpCode,
  //     });
  //     var response = await apiService!.postData(
  //       endPoint: EndPoints.verifyOtp,
  //       isMultipart: true,
  //       data: formData,
  //     );
  //     VerifyOtpModel result = VerifyOtpModel.fromJson(response.data);
  //     return right(result);
  //
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }
  //
  //
  // @override
  // Future<Either<Failure, ResendOtpModel>> resendOtp({
  //   required String email,
  // }) async {
  //   try {
  //     var response = await apiService!.getData(
  //       endPoint: "${EndPoints.resendOtp}/$email",
  //     );
  //     ResendOtpModel result = ResendOtpModel.fromJson(response.data);
  //     return right(result);
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }


}
