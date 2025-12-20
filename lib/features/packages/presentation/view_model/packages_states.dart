import 'package:el_kottab/features/packages/data/models/packages_model.dart';

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