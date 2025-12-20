import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/packages_model.dart';

abstract class PackagesRepo{

   Future<Either<Failure,PackagesModel>> getAllPackages();




}