
import 'package:dartz/dartz.dart';

import '../../../../core/app_services/remote_services/api_service.dart';
import '../../../../core/app_services/remote_services/end_points.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../models/random_teacher_model.dart';
import 'free_learning_repo.dart';


class FreeLearningRepoImpl implements FreeLearningRepo {
  final ApiService? apiService;
  FreeLearningRepoImpl(this.apiService);




@override
Future<Either<Failure, RandomTeacherModel>> getRandomTeacher() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.randomTeacher,
    );
    RandomTeacherModel result = RandomTeacherModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}