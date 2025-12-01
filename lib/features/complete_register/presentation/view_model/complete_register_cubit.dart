import '../../../../main_imports.dart';
import '../../data/repos/complete_register_repos.dart';
import 'complete_register_states.dart';

class CompleteRegisterCubit extends Cubit<CompleteRegisterStates> {
  CompleteRegisterCubit(this.loginRepo) : super(CompleteRegisterInitState());
  CompleteRegisterRepo? loginRepo;

  // CompleteRegisterCubitModel? loginModel;
  // Future<void> login({
  //   required String email,
  //   required String password,
  // })
  // async {
  //   emit(CompleteRegisterCubitLoadingState());
  //   var result = await loginRepo!.login(email: email, password: password);
  //   return result.fold((failure) {
  //     emit(CompleteRegisterCubitErrorState(failure.errMessage));
  //   }, (data) async {
  //     loginModel = data;
  //     emit(CompleteRegisterCubitSuccessState(data));
  //   });
  // }


  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();
  bool isPasswordVisible = true;
  changePasswordVisible()
  {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

  String gender = '';
  selectGender(newGender)
  {
    gender = newGender;
    emit(SelectGenderState());
  }

}