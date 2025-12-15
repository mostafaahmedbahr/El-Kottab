

abstract class ProfileStates{}

class ProfileInitState extends ProfileStates{}

class GetProfileDataLoadingState extends ProfileStates{}
class GetProfileDataErrorState extends ProfileStates{
  final String error;
  GetProfileDataErrorState(this.error);

}
class GetProfileDataSuccessState extends ProfileStates{}








