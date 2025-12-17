import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/all_teachers_model.dart';

abstract class TeachersRepo{
  Future<Either<Failure , AllTeachersModel>> getAllTeachers();




}
