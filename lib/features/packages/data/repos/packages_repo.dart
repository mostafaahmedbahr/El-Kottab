import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/packages_model.dart';
import '../models/subscribe_to_package_model.dart';

abstract class PackagesRepo{

   Future<Either<Failure,PackagesModel>> getAllPackages();
   Future<Either<Failure,SubscribeToPackageModel>> subscribeToPackage({required int packageId});




}