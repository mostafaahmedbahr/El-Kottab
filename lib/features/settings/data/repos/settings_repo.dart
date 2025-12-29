import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/terms_and_conditions_model.dart';

abstract class SettingsRepo{

  Future<Either<Failure,TermsAndConditionsModel>> getTermsAndConditions();





}