import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/teachers/data/repos/teachers_repo.dart';
import '../../../../main_imports.dart';
import '../models/all_teachers_model.dart';

class TeachersRepoImpl implements TeachersRepo {
  final ApiService? apiService;

  TeachersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllTeachersModel>> getAllTeachers() async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.allTeachers,
      );
      AllTeachersModel result = AllTeachersModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
