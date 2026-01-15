import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/teacher_details_model.dart';
import '../models/teacher_reviews_model.dart';

abstract class TeacherDetailsRepo{
  Future<Either<Failure , TeachersDetailsModel>> getTeachersDetails({
    required int teacherId,
  });
  Future<Either<Failure,TeacherReviewsModel>> getTeacherReviews({required int teacherId});



}
