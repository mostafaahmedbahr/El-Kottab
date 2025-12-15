

abstract class HomeStates{}

class HomeInitState extends HomeStates{}

class ChangeHomeSliderImageState extends HomeStates{}

class GetHomeSliderLoadingState extends HomeStates{}
class GetHomeSliderErrorState extends HomeStates{
  final String error;
  GetHomeSliderErrorState(this.error);

}
class GetHomeSliderSuccessState extends HomeStates{}

class GetBestTeachersLoadingState extends HomeStates{}
class GetBestTeachersErrorState extends HomeStates{
  final String error;
  GetBestTeachersErrorState(this.error);

}
class GetBestTeachersSuccessState extends HomeStates{}






