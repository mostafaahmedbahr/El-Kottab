import 'dart:async';

import 'package:match_kora_app/features/forget_password/presentation/view_model/reset_password_states.dart';

import '../../../../main_importants.dart';
import '../../data/models/reset_password_model.dart';
import '../../data/repos/forget_password_repo.dart';




class ResetPasswordCubit extends Cubit<ResetPasswordStates> {

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitState());

  final ResetPasswordRepo? resetPasswordRepo;
  ResetPasswordModel? resetPasswordModel;

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordRepo!.resetPassword(
        newPassword: newPassCon.text,
        newPasswordConfirmation: newPassConfirmationCon.text,
      userId: CacheHelper.getData(key: "userId"),
    );
    result.fold(
          (failure){
        emit(ResetPasswordErrorState(failure.errMessage));
      },
          (data) {
            resetPasswordModel = data;
        emit(ResetPasswordSuccessState(data));
      },
    );
  }


  var newPassCon = TextEditingController();
  var newPassConfirmationCon = TextEditingController();
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
}
