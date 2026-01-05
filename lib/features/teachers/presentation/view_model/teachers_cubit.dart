
import 'package:el_kottab/features/teachers/data/models/add_to_fav_model.dart';
import 'package:el_kottab/features/teachers/data/models/all_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/fav_teachers_model.dart';
import 'package:el_kottab/features/teachers/data/models/remove_teacher_from_fav_model.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/teachers_repo.dart';

class TeachersCubit extends Cubit<TeachersStates> {
  TeachersCubit(this.teachersRepo) : super(TeachersInitState());

  TeachersRepo? teachersRepo;

  static TeachersCubit get(context) => BlocProvider.of(context);


  int buttonValue = 0;

  final PageController pageController = PageController();

  void updateButtonValue(int value) {
    buttonValue = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(TeachersButtonChangedState());
  }

  void onPageChanged(int index) {
    buttonValue = index;
    emit(TeachersButtonChangedState());
  }


  AllTeachersModel? allTeachersModel;
  Future<void> getAllTeachers()
  async {
    emit(GetAllTeachersLoadingState());
    var result = await teachersRepo!.getAllTeachers();
    return result.fold((failure) {
      emit(GetAllTeachersErrorState(failure.errMessage));
    }, (data) async {
      allTeachersModel = data;
      emit(GetAllTeachersSuccessState(data));
    });
  }


  AddToFavModel? addToFavModel;
  Future<void> addToFav({required int teacherId})
  async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.addToFav(teacherId: teacherId);
    return result.fold((failure) {
      emit(AddTeachersFavErrorState(failure.errMessage));
    }, (data) async {
      addToFavModel = data;
      emit(AddTeachersFavSuccessState(data));
    });
  }

  RemoveTeacherFromFavModel? removeTeacherFromFavModel;
  Future<void> removeTeacherFromFav({required int teacherId})
  async {
    emit(AddTeachersFavLoadingState());
    var result = await teachersRepo!.removeTeacherFromFav(teacherId: teacherId);
    return result.fold((failure) {
      emit(AddTeachersFavErrorState(failure.errMessage));
    }, (data) async {
      removeTeacherFromFavModel = data;
      emit(AddTeachersFavSuccessState(data));
    });
  }


  FavTeachersModel? favTeachersModel;
  Future<void> getFavTeachers()
  async {
    emit(GetAllFavTeachersLoadingState());
    var result = await teachersRepo!.getFavTeachers();
    return result.fold((failure) {
      emit(GetAllFavTeachersErrorState(failure.errMessage));
    }, (data) async {
      favTeachersModel = data;
      emit(GetAllFavTeachersSuccessState(data));
    });
  }

}