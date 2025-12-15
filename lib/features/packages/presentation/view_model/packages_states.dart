abstract class PackagesStates{}

class PackagesInitState extends PackagesStates{}

class GetAllPackagesLoadingState extends PackagesStates{}
class GetAllPackagesErrorState extends PackagesStates{
  final String error;
  GetAllPackagesErrorState(this.error);

}
class GetAllPackagesSuccessState extends PackagesStates{}


class SubscribePackageLoadingState extends PackagesStates{}
class SubscribePackageErrorState extends PackagesStates{
  final String error;
  SubscribePackageErrorState(this.error);

}
class SubscribePackageSuccessState extends PackagesStates{}