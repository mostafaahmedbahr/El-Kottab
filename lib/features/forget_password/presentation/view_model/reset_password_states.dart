

import 'package:match_kora_app/features/forget_password/data/models/reset_password_model.dart';

abstract class ResetPasswordStates{}

class ResetPasswordInitState extends ResetPasswordStates{}

class ResetPasswordLoadingState extends ResetPasswordStates{}
class ResetPasswordSuccessState extends ResetPasswordStates{
  ResetPasswordModel resetPasswordModel;
  ResetPasswordSuccessState(this.resetPasswordModel);
}
class ResetPasswordErrorState extends ResetPasswordStates{
  final String error;
  ResetPasswordErrorState(this.error);
}

class ChangeSuffixIconState  extends ResetPasswordStates{}
class ChangeSuffixIconState2  extends ResetPasswordStates{}