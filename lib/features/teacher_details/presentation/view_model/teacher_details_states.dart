abstract class TeacherDetailsStates{}

class TeacherDetailsInitState extends TeacherDetailsStates{}

class GetTeacherDetailsLoadingState extends TeacherDetailsStates{}
class GetTeacherDetailsErrorState extends TeacherDetailsStates{
  final String error;

  GetTeacherDetailsErrorState(this.error);
}
class GetTeacherDetailsSuccessState extends TeacherDetailsStates{}