import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';

abstract class TeachersStates{}

class TeachersInitState extends TeachersStates{}

class TeachersButtonChangedState extends TeachersStates {}


class GetAllTeachersLoadingState extends TeachersStates {}
class GetAllTeachersErrorState extends TeachersStates {
  final String error;
  GetAllTeachersErrorState(this.error);

}
class GetAllTeachersSuccessState extends TeachersStates {
  final AllTeachersModel allTeachersModel;
  GetAllTeachersSuccessState(this.allTeachersModel);
}



class AddTeachersFavLoadingState extends TeachersStates {}
class AddTeachersFavErrorState extends TeachersStates {
  final String error;
  AddTeachersFavErrorState(this.error);

}
class AddTeachersFavSuccessState extends TeachersStates {}
