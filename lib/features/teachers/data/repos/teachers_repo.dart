import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/add_to_fav_model.dart';
import '../models/all_teachers_model.dart';
import '../models/fav_teachers_model.dart';
import '../models/remove_teacher_from_fav_model.dart';

abstract class TeachersRepo{
  Future<Either<Failure , AllTeachersModel>> getAllTeachers();
  Future<Either<Failure , FavTeachersModel>> getFavTeachers();
  Future<Either<Failure , AddToFavModel>> addToFav({required int teacherId});
  Future<Either<Failure , RemoveTeacherFromFavModel>> removeTeacherFromFav({required int teacherId});




}
