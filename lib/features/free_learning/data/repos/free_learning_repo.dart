
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/random_teacher_model.dart';

abstract class FreeLearningRepo{

 Future<Either<Failure,RandomTeacherModel>> getRandomTeacher();




}