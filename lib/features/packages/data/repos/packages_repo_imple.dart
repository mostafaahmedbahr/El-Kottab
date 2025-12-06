
import 'package:el_kottab/features/packages/data/repos/packages_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';


class PackagesRepoImpl implements PackagesRepo {
  final ApiService? apiService;
  PackagesRepoImpl(this.apiService);




// @override
// Future<Either<Failure, TryThisProductsModel>> getTryThisProductsData() async{
//   try {
//     var response = await apiService!.getData(
//       endPoint: EndPoints.mostSellingProducts,
//     );
//     TryThisProductsModel result = TryThisProductsModel.fromJson(response.data);
//     return right(result);
//   } catch (e) {
//     return left(handleError(e));
//   }
// }








}