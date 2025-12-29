import 'package:el_kottab/features/profile/data/models/logout_model.dart';
import 'package:el_kottab/features/profile/data/models/profile_model.dart';

import '../../data/models/terms_and_conditions_model.dart';

abstract class SettingsStates{}

class SettingsInitState extends SettingsStates{}

class GetTermsAndConditionsDataLoadingState extends SettingsStates{}
class GetTermsAndConditionsDataErrorState extends SettingsStates{
  final String error;
  GetTermsAndConditionsDataErrorState(this.error);

}
class GetTermsAndConditionsDataSuccessState extends SettingsStates{
  final TermsAndConditionsModel termsAndConditionsModel;
  GetTermsAndConditionsDataSuccessState(this.termsAndConditionsModel);

}

class LogoutLoadingState extends SettingsStates{}
class LogoutSuccessState extends SettingsStates{
  final LogoutModel logoutModel;
  LogoutSuccessState(this.logoutModel);
}
class LogoutErrorState extends SettingsStates{
  final String error;
  LogoutErrorState(this.error);

}








