


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/best_teachers_model.dart';
import '../models/home_banners_model.dart';

abstract class HomeRepo{

   Future<Either<Failure,HomeBannersModel>> getHomeBanners();
   Future<Either<Failure,BestTeachersModel>> getBestTeachers();




}