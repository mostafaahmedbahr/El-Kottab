import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/packages/data/repos/packages_repo.dart';
import '../../../../main_imports.dart';
import '../models/packages_model.dart';
import '../models/subscribe_to_package_model.dart';


class PackagesRepoImpl implements PackagesRepo {
  final ApiService? apiService;
  PackagesRepoImpl(this.apiService);



@override
Future<Either<Failure, PackagesModel>> getAllPackages() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.plans,
    );
    PackagesModel result = PackagesModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}


  @override
  Future<Either<Failure, SubscribeToPackageModel>> subscribeToPackage({required int packageId}) async{
    try {
      var response = await apiService!.postData(
        endPoint: "plans/$packageId/subscribe",
      );
      SubscribeToPackageModel result = SubscribeToPackageModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }








}