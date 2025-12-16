import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/profile/data/models/logout_model.dart';
import '../../../../core/errors/failure.dart';
import '../models/profile_model.dart';

abstract class ProfileRepo{

    Future<Either<Failure,LogoutModel>> logout();
    Future<Either<Failure,ProfileModel>> getProfileData();




}