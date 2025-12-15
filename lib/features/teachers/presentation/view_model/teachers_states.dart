abstract class TeachersStates{}

class TeachersInitState extends TeachersStates{}

class TeachersButtonChangedState extends TeachersStates {}


class GetAllTeachersLoadingState extends TeachersStates {}
class GetAllTeachersErrorState extends TeachersStates {
  final String error;
  GetAllTeachersErrorState(this.error);

}
class GetAllTeachersSuccessState extends TeachersStates {}



class AddTeachersFavLoadingState extends TeachersStates {}
class AddTeachersFavErrorState extends TeachersStates {
  final String error;
  AddTeachersFavErrorState(this.error);

}
class AddTeachersFavSuccessState extends TeachersStates {}
