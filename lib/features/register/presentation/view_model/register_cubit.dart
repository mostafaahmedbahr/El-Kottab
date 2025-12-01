import 'dart:io';
import 'package:el_kottab/features/register/presentation/view_model/register_states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main_imports.dart';
import '../../data/repos/register_repos.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(RegisterInitState());

  RegisterRepo? registerRepo;
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }

  bool isVisible2 = true;

  void changeSuffixIcon2() {
    isVisible2 = !isVisible2;
    emit(ChangeSuffixIconState2());
  }



  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var webSiteUrlCon = TextEditingController();
  var passCon = TextEditingController();
  var confirmPassCon = TextEditingController();
  var phoneCon = TextEditingController();



  //
  // RegisterModel? registerModel;
  // Future<void> register({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required File? image,
  //   required String password,
  //   required String passwordConfirmation,
  //   required int countryId,
  //   required String cityId,
  // }) async {
  //   emit(SignUpLoading());
  //   FormData formData = FormData.fromMap({
  //     "image": image != null
  //         ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last)
  //         : null,
  //     "name": name,
  //     "email": email,
  //     "phone": phone,
  //     "country_id": countryId,
  //     "city_id": cityId,
  //     "password": password,
  //     "password_confirmation": passwordConfirmation,
  //     "country":CacheHelper.getData(key: "userCountry"),
  //     "city":CacheHelper.getData(key: "userCity"),
  //     "fcm_token":CacheHelper.getData(key: "fcmToken"),
  //   });
  //   final result = await registerRepo!.register(data: formData);
  //   return result.fold((failure) {
  //     emit(SignUpError(failure.errMessage));
  //   }, (data) async {
  //     registerModel = data;
  //     emit(SignUpSuccess(data));
  //     cacheUserInfo(
  //       token: "${data.data!.token}",
  //       phone: data.data!.phone.toString(),
  //       id:  data.data!.id!,
  //       email: "${data.data!.email}",
  //     );
  //     clearProfileImage();
  //     clearControllers();
  //   });
  // }


  // clearControllers(){
  //   nameCon.clear();
  //   emailCon.clear();
  //   passCon.clear();
  //   confirmPassCon.clear();
  //   selectedCountry=null;
  //   selectedCity=null;
  //   phoneNumber='';
  //   phoneCon.clear();
  //   emit(RegisterInitState());
  // }
  //
  // cacheUserInfo({required String token ,
  //   required String phone ,
  //   required int id ,
  //   required String email,
  // })
  // async {
  //   await CacheTokenManger.saveUserToken(token);
  //   CacheHelper.saveData(key: "userPhone", value: phone);
  //   CacheHelper.saveData(key: "userId", value: id);
  //   CacheHelper.saveData(key: "userEmail", value: email);
  // }








}