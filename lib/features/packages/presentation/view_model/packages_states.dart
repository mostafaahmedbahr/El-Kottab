import 'package:el_kottab/features/packages/data/models/packages_model.dart';

import '../../../../core/utils/enums.dart';

abstract class PackagesStates{}

class PackagesInitState extends PackagesStates{}

class GetAllPackagesLoadingState extends PackagesStates{}
class GetAllPackagesErrorState extends PackagesStates{
  final String error;
  GetAllPackagesErrorState(this.error);

}
class GetAllPackagesSuccessState extends PackagesStates{
  final PackagesModel packagesModel;
  GetAllPackagesSuccessState(this.packagesModel);
}


class SubscribePackageLoadingState extends PackagesStates{}
class SubscribePackageErrorState extends PackagesStates{
  final String error;
  SubscribePackageErrorState(this.error);

}
class SubscribePackageSuccessState extends PackagesStates{}

class CurrencyChangedState extends PackagesStates {
  final Currency currency;
  CurrencyChangedState(this.currency);
}