
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo.dart';

import '../../../../core/app_services/remote_services/api_service.dart';



class TeacherDetailsRepoImpl implements TeacherDetailsRepo {
  final ApiService? apiService;
  TeacherDetailsRepoImpl(this.apiService);




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