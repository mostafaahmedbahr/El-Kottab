import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/packages/data/repos/packages_repo.dart';
import '../../../../main_imports.dart';
import '../models/packages_model.dart';


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








}