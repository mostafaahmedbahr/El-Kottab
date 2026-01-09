import 'package:dartz/dartz.dart';
import 'package:el_kottab/features/teachers/data/repos/teachers_repo.dart';
import '../../../../main_imports.dart';
import '../models/add_to_fav_model.dart';
import '../models/all_teachers_model.dart';
import '../models/fav_teachers_model.dart';
import '../models/remove_teacher_from_fav_model.dart';

class TeachersRepoImpl implements TeachersRepo {
  final ApiService? apiService;

  TeachersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllTeachersModel>> getAllTeachers()
  async {
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

  @override
  Future<Either<Failure, AddToFavModel>> addToFav({required int teacherId})
  async {
    try {
      var data = FormData.fromMap({
        'teacher_id': teacherId
      });

      var response = await apiService!.postData(
        endPoint: EndPoints.favourites,
        data: data
      );
      AddToFavModel result = AddToFavModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, FavTeachersModel>> getFavTeachers()
  async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.favourites,
      );
      FavTeachersModel result = FavTeachersModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, RemoveTeacherFromFavModel>> removeTeacherFromFav({required int teacherId})
  async {
    try {
      var response = await apiService!.deleteData(
          endPoint: "${EndPoints.favourites}/$teacherId",
      );
      RemoveTeacherFromFavModel result = RemoveTeacherFromFavModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

}
