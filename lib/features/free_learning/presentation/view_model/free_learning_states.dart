import 'package:el_kottab/features/free_learning/data/models/random_teacher_model.dart';

abstract class FreeLearningStates{}

class FreeLearningInitState extends FreeLearningStates{}

class GetRandomTeacherLoadingState extends FreeLearningStates{}
class GetRandomTeacherErrorState extends FreeLearningStates{
  final String error;
  GetRandomTeacherErrorState(this.error);

}
class GetRandomTeacherState extends FreeLearningStates{
  final RandomTeacherModel randomTeacherModel;
  GetRandomTeacherState(this.randomTeacherModel);
}