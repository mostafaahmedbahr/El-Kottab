

import 'package:el_kottab/features/profile/data/models/logout_model.dart';

abstract class ProfileStates{}

class ProfileInitState extends ProfileStates{}

class GetProfileDataLoadingState extends ProfileStates{}
class GetProfileDataErrorState extends ProfileStates{
  final String error;
  GetProfileDataErrorState(this.error);

}
class GetProfileDataSuccessState extends ProfileStates{}

class LogoutLoadingState extends ProfileStates{}
class LogoutSuccessState extends ProfileStates{
  final LogoutModel logoutModel;
  LogoutSuccessState(this.logoutModel);
}
class LogoutErrorState extends ProfileStates{
  final String error;
  LogoutErrorState(this.error);

}








