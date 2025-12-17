import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo.dart';
import '../../../../main_imports.dart';
import '../models/teacher_details_model.dart';

class TeacherDetailsRepoImpl implements TeacherDetailsRepo {
  final ApiService? apiService;

  TeacherDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, TeachersDetailsModel>> getTeachersDetails({
    required int teacherId,
  }) async {
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.teacher}/$teacherId",
      );
      TeachersDetailsModel result = TeachersDetailsModel.fromJson(
        response.data,
      );
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
