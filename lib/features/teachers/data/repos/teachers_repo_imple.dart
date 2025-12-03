
import 'package:el_kottab/features/teachers/data/repos/teachers_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';



class TeachersRepoImpl implements TeachersRepo {
  final ApiService? apiService;
  TeachersRepoImpl(this.apiService);




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