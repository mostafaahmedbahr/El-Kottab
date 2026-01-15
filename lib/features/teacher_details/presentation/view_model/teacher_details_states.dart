import 'package:el_kottab/features/teacher_details/data/models/teacher_details_model.dart';

import '../../data/models/teacher_reviews_model.dart';

abstract class TeacherDetailsStates{}

class TeacherDetailsInitState extends TeacherDetailsStates{}

class GetTeacherDetailsLoadingState extends TeacherDetailsStates{}
class GetTeacherDetailsErrorState extends TeacherDetailsStates{
  final String error;

  GetTeacherDetailsErrorState(this.error);
}
class GetTeacherDetailsSuccessState extends TeacherDetailsStates{
  final TeachersDetailsModel teachersDetailsModel;
  GetTeacherDetailsSuccessState(this.teachersDetailsModel);

}

class GetTeacherReviewsLoadingState extends TeacherDetailsStates{}
class GetTeacherReviewsSuccessState extends TeacherDetailsStates{
  final TeacherReviewsModel teacherReviewsModel;
  GetTeacherReviewsSuccessState(this.teacherReviewsModel);
}
class GetTeacherReviewsErrorState extends TeacherDetailsStates{
  final String error;
  GetTeacherReviewsErrorState(this.error);
}

