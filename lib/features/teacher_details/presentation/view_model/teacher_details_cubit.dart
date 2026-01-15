
import 'package:el_kottab/features/teacher_details/data/models/teacher_details_model.dart';
import 'package:el_kottab/features/teacher_details/data/repos/teacher_details_repo.dart';
import 'package:el_kottab/features/teacher_details/presentation/view_model/teacher_details_states.dart';

import '../../../../main_imports.dart';
import '../../data/models/teacher_reviews_model.dart';

class TeacherDetailsCubit extends Cubit<TeacherDetailsStates> {
  TeacherDetailsCubit(this.teacherDetailsRepo) : super(TeacherDetailsInitState());

  TeacherDetailsRepo? teacherDetailsRepo;
  static TeacherDetailsCubit get(context) => BlocProvider.of(context);



  TeachersDetailsModel? teachersDetailsModel;
  Future<void> getTeachersDetails({ required int teacherId,   bool loading = true})
  async {
    if(loading == true){
      emit(GetTeacherDetailsLoadingState());
    }
    var result = await teacherDetailsRepo!.getTeachersDetails(teacherId: teacherId);
    return result.fold((failure) {
      emit(GetTeacherDetailsErrorState(failure.errMessage));
    }, (data) async {
      teachersDetailsModel = data;
      emit(GetTeacherDetailsSuccessState(data));
    });
  }


  TeacherReviewsModel? teacherReviewsModel;
  Future<void> getTeacherReviews({required int teacherId})
  async {
    emit(GetTeacherReviewsLoadingState());
    var result = await teacherDetailsRepo!.getTeacherReviews(teacherId: teacherId);
    return result.fold((failure) {
      emit(GetTeacherReviewsErrorState(failure.errMessage));
    }, (data) async {
      teacherReviewsModel = data;
      emit(GetTeacherReviewsSuccessState(data));
    });
  }


}